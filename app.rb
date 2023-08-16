require_relative 'classes/gameapp'
require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'classes/item'

class App
  def initialize
    puts 'load_collections'
    @books = []
    @music_albums = []
    @gameapp = GameApp.new
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def option_methods(option)
    case option
    when 1..6
      list(option)
    when 7..9
      add(option)
    else
      puts 'Thank you for using this app!'
      save_and_exit
    end
  end

  def list(option)
    case option
    when 1
      puts 'list_all_books'
    when 2
      puts 'list_all_musicAlbums'
    when 3
      @gameapp.list_all_games
    when 4
      puts 'list_all_genres'
    when 5
      puts 'list_all_labels'
    else
      @gameapp.list_all_authors
    end
  end

  def add(option)
    case option
    when 7
      puts 'add_book'
    when 8
      puts 'add_musicAlbum'
    else
      loop do
        @gameapp.add_game
        @gameapp.add_author
        @gameapp.display_msg
        break unless @gameapp.continue_option == 'y'
      end
    end
  end

  def save_and_exit
    puts 'save_collections'
    exit
  end
end
