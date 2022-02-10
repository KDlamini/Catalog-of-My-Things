require './modules/helpers'
require './modules/add_book'
require './modules/add_album'
require './modules/list_items'
require './modules/preserver_module'
require './classes/label'
require './modules/add_label'
require './modules/add_game'
require './classes/author'

# Create App class
class App
  include Helpers
  include CreateBook
  include CreateLabel
  include CreateAlbum
  include CreateGame
  include ListItems
  include PreserverModule

  def initialize
    @labels = fetch_labels
    @books = fetch_books
    @albums = load_file('albums')
    @genres = load_file('genres')
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

    if input.to_i.between?(1, 6)
      clear
      list_selection(input)
    elsif input.to_i.between?(7, 9)
      clear
      add_selection(input)
    elsif input == '10'
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
    3 - List of games
    4 - List all genres (e.g 'Comedy', 'Thriller')
    5 - List all labels (e.g. 'Gift', 'New')
    6 - List all authors (e.g. 'Stephen King')
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - exit
    "
  end

  def list_selection(input)
    case input
    when '1'
      list_all_books
      continue?
    when '2'
      list_all_albums
    when '3'
      list_all_games
      continue?
    when '4'
      list_all_genres
    when '5'
      list_labels
      continue?
    when '6'
      list_authors
      continue?
    end
  end

  def add_selection(input)
    case input
    when '7'
      add_book
    when '8'
      add_new_album
    when '9'
      add_game
    when '10'
      exit
    end
  end

 
  def update_albums(album)
    @albums << album
    save_data_as_json(@albums, 'albums')
  end

  def update_genres(genre)
    @genres << genre
    save_data_as_json(@genres, 'genres')
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
