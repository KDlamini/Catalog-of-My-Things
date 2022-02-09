require './game'
require './list_items'

module CreateGame
  include ListItems

  def add_game
    print 'Is the game multiplayer?  enter Y for "Yes" and N for "no": '
    multiplayer = gets.chomp
    multiplayer = multiplayer == 'Y' || true

    print 'What is the game condition? [good/bad]: '
    cover_state = gets.chomp.downcase

    print 'When did you last play the game? (dd-mm-yyyy): '
    last_played_at = gets.chomp

    puts "\nSelect a game author by number: "
    list_authors
    author_index = gets.chomp.to_i
    author = @authors[author_index]
    game = Game.new(multiplayer, cover_state, last_played_at)

    author.add_item(game)
    update_games(game)
    puts "\nYour game has been added successfully ✔️"
    continue?
  end
end
