class App
  def initialize
    puts 'load_collections'
    @books = []
    @music_albums = []
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
      puts 'list_of_games'
    when 4
      puts 'list_all_genres'
    when 5
      puts 'list_all_labels'
    else
      puts 'list_all_authors'
    end
  end

  def add(option)
    case option
    when 7
      puts 'add_book'
    when 8
      puts 'add_musicAlbum'
    else
      puts 'add_game'
    end
  end

  def save_and_exit
    puts 'save_collections'
    exit
  end
end
