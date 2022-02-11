require 'json'

module PreserverModule
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

  def save_book(book)
    path = 'json/books.json'
    data = fetch_data(path)

    new_book = {
      title: book.label.title,
      author: "#{book.author.first_name} #{book.author.last_name}",
      publisher: book.publisher,
      cover_state: book.cover_state,
      publish_date: book.publish_date
    }

    data.push(new_book)
    save(path, data)
  end

  def save_label(label)
    path = 'json/labels.json'
    data = fetch_data(path)
    new_label = { title: label.title, color: label.color }

    data.push(new_label)
    save(path, data)
  end
end
