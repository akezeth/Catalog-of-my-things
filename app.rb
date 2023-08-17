require_relative 'classes/gameapp'
require_relative 'classes/author'
require_relative 'classes/game'
require_relative 'classes/item'
require_relative 'modules/modules'

class App
  include Modules

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
    load_collection
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
      list_all_books
    when 2
      list_all_music
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    else
      list_all_authors
    end
  end

  def add(option)
    case option
    when 7
      add_book
    when 8
      add_music
    else
      loop do
        add_game
        add_author
        display_msg
        break unless continue_option == 'y'
      end
    end
  end

  def save_and_exit
    save_collection
    exit
  end
end
