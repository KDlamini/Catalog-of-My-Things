require_relative 'helpers'

#Create App class
class App
    include Helpers

    def run
        puts "\nWelcome to the 'Catalog of my things' app"
        prompt_user
    end

    def prompt_user
        options
        input = gets.chomp
        selection(input)
    end

    def options
        puts "\n Choose from the options below: 
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

    def selection(input)
        case input
        when '1'
            puts 'List all books'
        when '2'
            puts 'List all music albums'
        when '3'
            puts 'List all movies'
        when '4'
            puts 'List of games'
        when '5'
            puts 'List all genres'
        when '6'
            puts 'List all labels'
        when '7'
            puts 'List all authors'
        when '8'
            puts 'List all sources'
        when '9'
            puts 'Add a book'
        when '10'
            puts 'Add a music album'
        when '11'
            puts 'Add a movie'
        when '12'
            puts 'Add a game'
        when '13'
            puts 'Goob bye (:......'
            exit
        end
    end
end

def load
    start = App.new
    start.run
end

load