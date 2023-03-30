require 'json'
require_relative './book'
require_relative './label'

module BookLabelModule
    def fetch_books
        book_path = './src/BOOK/books.json'
        File.open(book_path) do |file|
            JSON.load(file).map do |book|
                Book.new(book['publisher'], book['cover_state'], book['publish_date'])
            end
        end
    end

    def fetch_labels
        label_path = './src/BOOK/labels.json'
        File.open(label_path) do |file|
            JSON.load(file).map do |label|
                Label.new(label['name'], label['color'])
            end
        end
    end

    def add_book
       print "Book publisher: "
         publisher = gets.chomp
            print "Book cover state[good or bad]: "
                cover_state = gets.chomp
                    print "Book publish date[YYYY-MM-DD]: "
                        publish_date = gets.chomp
                            book = Book.new(publisher, cover_state, publish_date)

                            print "Book label: "
                                label_name = gets.chomp.upcase
                                print "Book label color: "
                                    label_color = gets.chomp
                                    label = Label.new(label_name, label_color)
                                    book_item = item(book.to_json)
                                    label.add_item(book_item)

                                    store_book(book)
                                    store_label(label)

                                    puts "Book added successfully"
                                    puts "Book label added successfully"
    end

    def store_book(book)
        books = fetch_books
        books << book.to_json
        File.write('./src/BOOK/books.json', JSON.pretty_generate(books))
    end

    def store_label(label)
        labels = fetch_labels
        labels << label.to_json
        File.write('./src/BOOK/labels.json', JSON.pretty_generate(labels))
    end

    def list_books
        books = fetch_books
        return puts "No books found" if books.empty?
        books.each do |book|
            puts "Book publisher: #{book.publisher}", "Book cover state: #{book.cover_state}", "Book publish date: #{book.publish_date}"
        end
    end

    def list_labels
        labels = fetch_labels
        return puts "No labels found" if labels.empty?
        labels.each do |label|
            puts "Label name: #{label.name}", "Label color: #{label.color}"
        end
    end
end