require 'json'

module FetchData
  def save_data_as_json(data, file_name)
    File.write("./json/#{file_name}.json", JSON.generate(data)) if data.any?
  end

  def load_file(file_name)
    if File.exist?("./json/#{file_name}.json")
      JSON.parse(File.read("./json/#{file_name}.json"))
    else
      []
    end
  end

  def create_file(path)
    Dir.mkdir('json') unless Dir.exist?('json')

    File.open(path, 'w') do |file|
      file.puts JSON.generate([])
    end
  end

  def fetch_data(path)
    JSON.parse(File.read(path), create_additions: true)
  end

  def save(path, data)
    File.write(path, JSON.generate(data, create_additions: true))
  end

  def file_exist?(path)
    File.exist? path
  end

  def fetch_books
    path = 'json/books.json'

    if file_exist?(path)
      fetch_data(path).map do |book|
        select_label = @labels.select { |label| label.title == book['title'] }
        new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        new_book.label = select_label[0]
        new_book
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_games
    path = 'json/games.json'
    if file_exist?(path)
      fetch_data(path).map do |game|
        new_book = Game.new(game['multiplayer'], game['name'], game['last_played_at'])
        new_book
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_labels
    path = 'json/labels.json'

    if file_exist?(path)
      fetch_data(path).map do |label|
        Label.new(label['title'], label['color'])
      end
    else
      create_file(path)
      []
    end
  end

  def fetch_authors
    path = 'json/authors.json'

    if file_exist?(path)
      fetch_data(path).map do |author|
        Author.new(author['first_name'], author['last_name'])
      end
    else
      create_file(path)
      []
    end
  end
end
