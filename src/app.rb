class App
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
		"Enter option: "

		opt = gets.chomp
	end
end