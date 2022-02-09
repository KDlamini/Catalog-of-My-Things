require_relative './game'
require './book'

module ListItems
  def list_labels
    @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title} | Color: #{label.color}" }
  end

  def list_authors
    @authors.each_with_index { |author, index| puts "#{index}) name: #{author.first_name} #{author.last_name}" }
  end

  def list_all_books
    puts 'List of all Books : '
    if @books.empty?
      puts "\n Books list is empty."
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.label.title} | Publisher: #{book.publisher} | Condition: #{book.cover_state}"
      end
    end

    continue?
  end

  def list_all_games
    puts 'List of all Games : '
    if @games.empty?
      puts "\n Games list is empty."
    else
      @games.each_with_index do |game, index|
        puts "
        #{index})
        multiplayer: #{game.multiplayer} |
        last played: #{game.last_played_at} |
        Condition: #{game.cover_state}
        "
      end
    end

    continue?
  end
end
