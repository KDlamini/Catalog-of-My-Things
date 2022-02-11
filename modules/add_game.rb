require './classes/game'
require_relative 'list_items'
require_relative 'add_author'

module CreateGame
  include ListItems
  include CreateAuthor

  def add_game
    print 'Is the game multiplayer?  enter Y for "Yes" and N for "no": '
    multiplayer = gets.chomp
    multiplayer = multiplayer == 'Y' || true

    print 'What is the name of the game?: '
    name = gets.chomp.capitalize

    print 'When did you last play the game? (dd-mm-yyyy): '
    last_played_at = gets.chomp

    puts "\nSelect a game author by number: "
    list_authors
    puts "#{@authors.size}) Add new Author"
    author_index = gets.chomp.to_i

    author = validate_authors_selection(author_index)
    game = Game.new(multiplayer, name, last_played_at)
    game.author = author

    update_games(game)
    puts "\nYour game has been added successfully ✔️"
    continue?
  end
end
