module CreateAuthor
  def add_author
    print "\nEnter the author's first_name: "
    first_name = gets.chomp
    first_name = first_name.split.each(&:capitalize!).join(' ')

    print "Enter the author's last_name: "
    last_name = gets.chomp
    last_name = last_name.split.each(&:capitalize!).join(' ')

    new_author = Author.new(first_name, last_name)

    update_authors(new_author)
    new_author
  end

  def validate_authors_selection(index)
    if index == @authors.size
      add_author
    elsif @authors[index]
      @authors[index]
    else
      clear
      puts "Invalid label selection. Please try again.\n\n"
      puts 'Select a book label by number/add new label'
      list_authors
      puts "#{@authors.size}) Add new label"
      authors_index = gets.chomp.to_i
      validate_authors_selection(authors_index)
    end
  end
end
