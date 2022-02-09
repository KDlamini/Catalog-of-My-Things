module CreateLabel
  def add_label
    print "\nEnter label title: "
    title = gets.chomp
    title = title.split.each(&:capitalize!).join(' ')

    print 'Enter label color: '
    color = gets.chomp.capitalize!

    new_label = Label.new(title, color)

    update_labels(new_label)
    new_label
  end

  def validate_label_selection(index)
    if index == @labels.size
      add_label
    elsif @labels[index]
      @labels[index]
    else
      clear
      puts "Invalid label selection. Please try again.\n\n"
      puts "Select a book label by number/add new label.\n\n"
      list_labels
      puts "#{@labels.size}) Add new label"
      label_index = gets.chomp.to_i
      validate_label_selection(label_index)
    end
  end
end
