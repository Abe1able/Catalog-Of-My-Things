require_relative './handle_author'
require_relative './handle_game'

class App
  include HandleGame
  include HandleAuthor

  def initialize
    @games = load_games
    @authors = load_authors
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
         "0. Exit\n\n" \
         'Enter option: '
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
    when '3'
      puts list_games
    when '6'
      puts list_author
    when '9'
      add_game
    when '0'
      puts 'Goodbye'
    else
      puts 'Invalid option'
    end
  end
end
