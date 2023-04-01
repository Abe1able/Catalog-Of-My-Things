require 'json'

module HandleGenre
  FILE_NAME = './storage/genres.json'.freeze

  def list_all_genre
    if @genres.empty?
      puts 'No Genre to be displayed!!'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Genre: #{genre.name}"
      end
    end
  end

  def load_genres
    File.new(FILE_NAME, 'w') unless File.exist?(FILE_NAME)
    file = File.read(FILE_NAME)
    genres = file.empty? ? [] : JSON.parse(file)
    create_genre_instance(genres)
  end

  def save_genres
    genres = []
    @genres.each do |genre|
      genres << {
        name: genre.name
      }
    end
    File.write(FILE_NAME, JSON.pretty_generate(genres))
  end

  private

  def create_genre_instance(genres)
    genres.map { |genre| Genre.new(genre['name']) }
  end
end
