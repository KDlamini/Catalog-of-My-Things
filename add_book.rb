require './book'

module CreateBook
  def add_book
    print 'Published date (dd-mm-yyyy): '
    publish_date = gets.chomp

    print 'What is the book condition? [good/bad]: '
    cover_state = gets.chomp.downcase

    print 'Who is the publisher?: '
    publisher = gets.chomp.downcase

    update_books(Book.new(publisher, cover_state, publish_date))
    puts "\nBook created successfully ✔️"
    continue?
  end
end