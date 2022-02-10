require './modules/helpers'
require './modules/add_book'
require './modules/list_items'
require './modules/preserver_module'
require './classes/label'
require './modules/add_label'
require './modules/add_game'
require './classes/author'
require './classes/game'

# Create App class
class App
  include Helpers
  include CreateBook
  include ListItems
  include CreateGame
  include PreserverModule
  include CreateLabel

  def initialize
    @labels = fetch_labels
    @books = fetch_books
    @games = []
    @authors = [Author.new('Hamid', 'Faris'), Author.new('David', 'Thlamini'), Author.new('Goliath', 'Smith')]
  end

  def run
    clear
    puts "\nWelcome to the 'Catalog of my things' app"
    prompt_user
  end

  def prompt_user
    options
    input = gets.chomp

    if input.to_i.between?(1, 8)
      clear
      list_selection(input)
    elsif input.to_i.between?(9, 12)
      clear
      add_selection(input)
    elsif input == '13'
      exit
    else
      invalid_prompt
      prompt_user
    end
  end

  def options
    puts "\nChoose from the options below:
    1 - List all books
    2 - List all music albums
    3 - List all movies
    4 - List of games
    5 - List all genres (e.g 'Comedy', 'Thriller')
    6 - List all labels (e.g. 'Gift', 'New')
    7 - List all authors (e.g. 'Stephen King')
    8 - List all sources (e.g. 'From a friend', 'Online shop')
    9 - Add a book
    10 - Add a music album
    11 - Add a movie
    12 - Add a game
    13 - exit
    "
  end

  def list_selection(input)
    case input
    when '1'
      list_all_books
      continue?
    when '2'
      puts 'List all music albums'
    when '3'
      puts 'List all movies'
    when '4'
      list_all_games
      continue?
    when '5'
      puts 'List all genres'
    when '6'
      list_labels
      continue?
    when '7'
      list_authors
      continue?
    when '8'
      puts 'List all sources'
    end
  end

  def add_selection(input)
    case input
    when '9'
      add_book
    when '10'
      puts 'Add a music album'
    when '11'
      puts 'Add a movie'
    when '12'
      add_game
    when '13'
      puts 'Goob bye (:......'
      exit
    end
  end

  def update_books(book)
    @books << book
    save_book(book)
  end

  def update_labels(label)
    @labels << label
    save_label(label)
  end

  def update_games(game)
    @games << game
  end
end

def load
  start = App.new
  start.run
end

load
