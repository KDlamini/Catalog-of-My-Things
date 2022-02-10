require './classes/book'
require_relative 'list_items'
require_relative 'add_label'

module CreateBook
  include ListItems
  include CreateLabel

  def add_book
    print 'Published date (yyyy-mm-dd): '
    publish_date = gets.chomp
    validate_date(publish_date)

    print 'What is the book condition? [new/old/good/bad]: '

    cover_state = gets.chomp.downcase
    cover_state = validate_condition(cover_state)

    print 'Who is the publisher?: '
    publisher = gets.chomp

    puts "\nSelect a book label by number/add new label"
    list_labels
    puts "#{@labels.size}) Add new label"
    label_index = gets.chomp.to_i

    label = validate_label_selection(label_index)
    book = Book.new(publisher, cover_state, publish_date)
    book.label = label

    update_books(book)
    puts "\nBook created successfully ✔️"
    continue?
  end

  def validate_date(date)
    format_ok = date.match(/\d{4}-\d{2}-\d{2}/)

    if format_ok
      nil
    else
      clear
      puts "Invalid date format. Please try again.\n\n"
      add_book
    end
  end

  def validate_condition(condition)
    condition = condition.capitalize

    if %w[Good Bad New Old].include?(condition)
      condition
    else
      clear
      puts "Invalid condition. Please try again.\n\n"
      print 'What is the book condition? [new/old/good/bad]: '

      cover_state = gets.chomp.downcase
      validate_condition(cover_state)
    end
  end
end
