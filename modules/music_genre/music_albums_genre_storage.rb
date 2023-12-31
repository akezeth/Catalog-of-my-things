require 'json'
require_relative '../../classes/music_album'
require_relative '../../classes/genre'

module MusicGenreStorage
  def save_file(file_name, data)
    File.write(file_name, JSON.pretty_generate(data))
  end

  def save_music_albums
    json_data = @music_albums.map do |music|
      {
        id: music.id,
        publish_date: music.publish_date,
        on_spotify: music.on_spotify,
        genre: music.genre.name
      }
    end
    save_file('data/music_albums.json', json_data)
  end

  def save_genres
    json_data = @genres.map do |genre|
      {
        id: genre.id,
        name: genre.name
      }
    end
    save_file('data/genres.json', json_data)
  end

  def load_data_from_file(file_name)
    data = File.read(file_name)
    JSON.parse(data)
  end

  def load_music_albums
    music_albums_hash = []
    return music_albums_hash unless File.exist?('data/music_albums.json')

    music_albums_hash = load_data_from_file('data/music_albums.json')

    music_albums_hash.each do |music|
      music_obj = MusicAlbum.new(id: music['id'], publish_date: music['publish_date'], on_spotify: music['on_spotify'])
      genre_obj = @genres.find { |genre| genre.name == music['genre'] }
      music_obj.add_genre(genre_obj)
      @music_albums << music_obj
    end
  end

  def load_genres
    genre_hash = []
    return genre_hash unless File.exist?('data/genres.json')

    genre_hash = load_data_from_file('data/genres.json')
    genre_hash.each do |genre|
      genre_obj = Genre.new(name: genre['name'], id: genre['id'])
      @genres << genre_obj
    end
  end
end
