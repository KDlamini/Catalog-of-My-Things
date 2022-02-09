require 'json'

module PreserverModule
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
        Book.new(book['publisher'], book['cover_state'], book['publish_date'])
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
    new_label = { title: label.title, color: book.color }

    data.push(new_label)
    save(path, data)
  end
end
