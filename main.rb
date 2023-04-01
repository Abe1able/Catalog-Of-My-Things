require_relative './src/app'

def main
  app = App.new
  loop do
    app.menu
    user_input = app.user_input('Enter a number: ')
    app.selected_option(user_input)
  end
end

main
