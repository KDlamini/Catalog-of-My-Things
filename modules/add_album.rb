require_relative '../classes/music_album'
require_relative '../classes/genre'

module CreateAlbum
  def capture_input(request_text)
    print "#{request_text}: "
    gets.chomp
  end

  def add_new_album
    puts "\n-------------------------------"
    puts "\nENTER MUSIC ALBUM DETAILS\n\n"

    album_name = capture_input('Input album name')
    publish_date = capture_input('Input relase date')
    genre_name = capture_input('Input genre name')
    on_spotify = capture_input('Is album on Spotify? (enter Y for "Yes" evertyhing else will be treated as "No"')

    on_spotify = on_spotify == 'Y' || false

    add_album(album_name, publish_date, genre_name, on_spotify)
    puts "\nNew Album Added!"
    puts "\n-------------------------------"
  end

  def add_album(album_name, publish_date, genre_name, on_spotify)
    new_album_instance = MusicAlbum.new(on_spotify, album_name, publish_date)
    new_genre_instance = Genre.new(genre_name)
    new_album_instance.genre = new_genre_instance

    hash = {
      'album_name' => new_album_instance.name,
      'publish_date' => new_album_instance.publish_date,
      'on_spotify?' => new_album_instance.on_spotify,
      'genre' => new_genre_instance.name
    }

    genre_hash = {
      'genre_name' => new_genre_instance.name
    }

    @albums << hash
    @genres << genre_hash
  end
end
