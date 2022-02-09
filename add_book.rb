require './book'
require './list_items'

module CreateBook
  include ListItems

  def add_book
    print 'Published date (dd-mm-yyyy): '
    publish_date = gets.chomp
    validate_date(publish_date)

    print 'What is the book condition? [good/bad]: '
    cover_state = gets.chomp.downcase
    cover_state = validate_condition(cover_state)

    print 'Who is the publisher?: '
    publisher = gets.chomp.downcase

    puts "\nSelect a book label by number: "
    list_labels
    label_index = gets.chomp.to_i
    label = @labels[label_index]
    book = Book.new(publisher, cover_state, publish_date)

    label.add_item(book)
    update_books(book)
    puts "\nBook created successfully ✔️"
    continue?
  end

  def validate_date(date)
    format_ok = date.match(/\d{2}-\d{2}-\d{4}/)

    if format_ok
      nil
    else
      clear
      puts "Invalid date format. Please try again.\n\n"
      add_book
    end
  end
end
