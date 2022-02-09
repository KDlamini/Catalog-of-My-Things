require './book'

module ListItems
  def list_labels
    @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title} | Color: #{label.color}" }
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
end
