require 'json'

module HandleMusicAlbums
  FILE_NAME = './storage/music_albums.json'.freeze

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music album to display!!'
    else
      @music_albums.each_with_index do |music_album, index|
        puts "#{index}) Label: #{music_album.label.title} | Author: #{music_album.author.first_name},#{music_album.author.last_name} | Genre: #{music_album.genre.name} | Publish Date: #{music_album.publish_date} | On Soundcloud: #{music_album.on_soundcloud}"
        puts
      end
    end
  end

  def add_music_album
    publish_date = user_input('Enter item publish date: ')
    on_soundcloud = user_input('Is this item on soundcloud [Y, N]: ').downcase == 'y'

    music_album = MusicAlbum.new(publish_date, on_soundcloud: on_soundcloud)
    create_an_item(music_album)
    @music_albums << music_album unless @music_albums.include?(music_album)
  end

  def load_music_albums
    File.new(FILE_NAME, 'w') unless File.exist?(FILE_NAME)
    file = File.read(FILE_NAME)
    music_albums = file.empty? ? [] : JSON.parse(file)
    create_music_albums_instance(music_albums)
  end

  def save_music_albums
    music_albums = []
    @music_albums.each do |music_album|
      music_albums << {
        publish_date: music_album.publish_date,
        on_soundcloud: music_album.on_soundcloud,
        genre: { name: music_album.genre.name },
        author: { first_name: music_album.author.first_name, last_name: music_album.author.last_name },
        source: { name: music_album.source.name },
        label: { title: music_album.label.title, color: music_album.label.color }
      }
    end
    File.write(FILE_NAME, JSON.pretty_generate(music_albums))
  end

  private

  def create_music_albums_instance(music_albums)
    music_albums_instances = []
    music_albums.each do |music_album|
      # create music album
      music_albums_instances << music_album_instance = MusicAlbum.new(music_album['publish_date'],
                                                                      on_soundcloud: music_album['on_soundcloud'])
      create_association_instances(music_album_instance, music_album)
    end

    music_albums_instances
  end

  def create_association_instances(item_instance, item)
    item_instance.add_genre(Genre.new(item['genre']['name']))
    item_instance.add_author(Author.new(item['author']['first_name'], item['author']['last_name']))
    item_instance.add_label(Label.new(item['label']['title'], item['label']['color']))
    item_instance.add_source(Source.new(item['source']['name']))
  end
end