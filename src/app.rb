require_relative './handle_author'
require_relative './handle_game'
require_relative './handle_books'
require_relative './handle_music_album'
require_relative './handle_labels'
require_relative './handle_genre'
require_relative './label'
require_relative './genre'
require_relative './author'
require_relative './music_album'

class App
  include HandleGame
  include HandleAuthor
  include HandleBooks
  include HandleMusicAlbums
  include HandleLabels
  include HandleGenre

  def initialize
    @games = load_games
    @authors = load_authors
    @books = load_books
    @music_albums = load_music_albums
    @labels = load_labels
    @genres = load_genres
    @curr_labels = []
    @curr_authors = []
  end

  def menu
    puts "Welcome to Catalog of My Things!\n" \
         "================================\n" \
         "1. List all books\n" \
         "2. List all music albums\n" \
         "3. List all games\n" \
         "4. List all genres\n" \
         "5. List all labels\n" \
         "6. List all authors\n" \
         "7. Add a book\n" \
         "8. Add a music album\n" \
         "9. Add a game\n" \
         "0. Exit\n\n"
  end

  def user_input(msg_to_user)
    print msg_to_user
    gets.chomp
  end

  def create_an_item(item)
    label_title = user_input('Enter item label title (e.g. "Gift", "New"): ')
    label_color = user_input('Enter item label color: ')

    author_first_name = user_input('Author first name: ')
    author_last_name = user_input('Author last name: ')

    genre_name = user_input("Item genre (e.g 'Horror', 'History'): ")

    label = Label.new(label_title, label_color)
    item.add_label(label)
    @curr_labels << label unless @curr_labels.include?(label)
    save_label(@curr_labels, label)

    author = Author.new(author_first_name, author_last_name)
    item.add_author(author)
    @authors << author unless @authors.include?(author)

    genre = Genre.new(genre_name)
    item.add_genre(genre)
    @genres << genre unless @genres.include?(genre)
  end

  def selected_option(options)
    case options
    when '1'
      puts list_books
    when '2'
      puts list_all_music_albums
    when '3'
      puts list_games
    when '4'
      puts list_all_genre
    when '5'
      puts list_labels
    when '6'
      puts list_author
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    when '0'
      puts 'Goodbye'
      exit
    else
      puts 'Invalid option'
    end
  end
end
