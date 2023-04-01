require_relative './game'
require_relative './author'
require_relative './handle_author'
require 'json'

module HandleGame
  include HandleAuthor
  def list_games
    if @games.empty?
      puts 'Please add new Game'
    else
      @games.each_with_index do |game, index|
        puts "#{index} Last_Played: #{game['last_played_at']}  Multiplayer: #{game['multiplayer']}"
        puts '_________________'
      end
    end
  end

  def add_game
    games = []
    last_played = user_input('Last played:  ')
    publish_date = user_input("Game's publish Date:  ")
    multiplayer = user_input('Multiplayer (Y/N) ')
    option = multiplayer == 'y'
    new_game = Game.new(last_played, publish_date, multiplayer: option)
    games << new_game unless games.include?(new_game)
    create_an_item(new_game)
    save_game(games, new_game)
    @games = load_games
    @authors = load_authors
  end

  def save_game(current_games, game_obj)
    game_array = []
    current_games.each do |game|
      game_array << {
        last_played_at: game.last_played_at,
        publish_date: game.publish_date,
        multiplayer?: game.multiplayer
      }
    end
    if File.exist?('./storage/game.json')
      file = File.read('./storage/game.json')
      game_data = JSON.parse(file)
      game_data << {
        last_played_at: game_obj.last_played_at,
        publish_date: game_obj.publish_date,
        multiplayer: game_obj.multiplayer
      }
      File.write('./storage/game.json', JSON.pretty_generate(game_data))
    else
      File.write('./storage/game.json', JSON.pretty_generate(game_array))
    end
  end

  def load_games
    games = []
    if File.exist?('./storage/game.json')
      file = File.read('./storage/game.json')
      game_data = JSON.parse(file)

      game_data.each do |game|
        games << game
      end
    end
    games
  end
end
