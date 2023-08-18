require_relative 'book_label/book_label'
require_relative 'book_label/load_book_label'
require_relative 'book_label/save_book_label'
require_relative 'music_genre/add_music_album'
require_relative 'music_genre/list_genres'
require_relative 'music_genre/list_music_albums'
require_relative 'music_genre/music_albums_genre_storage'
require_relative 'game_author/game_author'
require_relative 'game_author/load_game_author'
require_relative 'game_author/save_game_author'

module Modules
  include BookAndLabel
  include LoadBookAndLabelData
  include SaveBookAndLabelData
  include AddMusic
  include ListGenres
  include ListMusicAlbums
  include MusicGenreStorage
  include GameAndAuthor
  include LoadGameAndAuthorData
  include SaveGameAndAuthorData

  def load_collection
    load_books
    load_labels
    load_genres
    load_music_albums
    load_authors
    load_games
  end

  def save_collection
    save_book
    save_label
    save_music_albums
    save_genres
    save_authors
    save_games
  end
end
