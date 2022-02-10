module ListItems
  def list_labels
    puts 'List of all labels : '
    labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title} | Color: #{label.color}" }
  end

  def list_all_books
    puts 'List of all books : '
    if books.empty?
      puts "\nBooks list is empty."
    else
      books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.label.title} | Publisher: #{book.publisher} | Condition: #{book.cover_state}"
      end
    end

    continue?
  end

  def list_all_albums
    puts "\nNote: No albums available." if @albums.empty?

    puts "\n----------------------------"
    puts "\nALL ALBUMS\n\n"
    puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
    puts '-------------------------------------------------------'
    @albums.each do |album|
      puts "#{album['genre'].to_s.strip} \t| #{album['on_spotify?'].to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date'].to_s.strip.rjust(10)}"
      puts "\n---------------------------------------------------"
    end
  end

  def list_all_genres
    puts "\nNote: No genres available." if @genres.empty?

    puts "\n----------------------------"
    puts "\nALL GENRES\n\n"
    puts "\Name"
    puts '----------------------------'
    @genres.each do |genre|
      puts genre['genre_name'].to_s.strip
      puts "\n----------------------------"
    end
  end
end
