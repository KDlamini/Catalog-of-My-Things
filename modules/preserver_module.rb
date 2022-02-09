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

  def save_book(book)
    path = 'json/books.json'
    data = fetch_data(path)

    new_book = { 
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date,
    }

    data.push(new_book)
    save(path, data)
  end
end
