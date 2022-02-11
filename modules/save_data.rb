require_relative 'fetch_data'

module SaveData
  include FetchData
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

  def save_game(game)
    path = 'json/games.json'
    data = fetch_data(path)
    new_game = { multiplayer: game.multiplayer, name: game.name, last_played_at: game.last_played_at }
    data.push(new_game)
    save(path, data)
  end

  def save_label(label)
    path = 'json/labels.json'
    data = fetch_data(path)
    new_label = { title: label.title, color: label.color }
    data.push(new_label)
    save(path, data)
  end

  def save_author(author)
    path = 'json/authors.json'
    data = fetch_data(path)
    new_author = { first_name: author.first_name, last_name: author.last_name }
    data.push(new_author)
    save(path, data)
  end
end
