require 'date'

module GameAndAuthor
  # Add authors-----------------------------
  def add_author
    puts 'Type the Author [First Name]: '
    first_name = gets.chomp
    puts 'Type the Author [Last Name]: '
    last_name = gets.chomp
    existing_author = find_existing_author(first_name, last_name)
    if existing_author
      puts 'Existing author found'
      author = existing_author
    else
      puts 'Creating author...'
      author = Author.new(first_name: first_name, last_name: last_name)
      @authors << author
    end
    author
  end

  # Add games-------------------------------
  def add_game
    puts 'Adding a Game'
    puts '===================================================================================================='
    puts 'Type the Game [publish date] (yyyy-mm-dd):'
    publish_date = Date.parse(gets.chomp)
    puts 'Type if Game is [multiplayer] (y/n)?: '
    multiplayer = gets.chomp.downcase == 'y'
    puts 'Type when the Game was [last played at] (yyyy-mm-dd): '
    last_played_date = Date.parse(gets.chomp)
    game = Game.new(
      publish_date: publish_date,
      multiplayer: multiplayer,
      played_at_date: last_played_date
    )
    @games << game
  end

  # List all authors-----------------------
  def list_all_authors
    if @authors.empty?
      puts '❌ Authors Not Found'
    else
      puts '👨 List of Authors: '
      @authors.each do |author|
        puts "ID:#{author.id} Fullname: #{author.first_name} #{author.last_name}"
      end
    end
  end

  # List all Games-----------------------
  def list_all_games
    if @games.empty?
      puts '❌ Games Not Found'
    else
      puts '🎮 List of Games:'
      @games.each_with_index do |game, index|
        print "#{index + 1}. Multiplayer: #{game.multiplayer},"
        puts " Publlish Date: #{game.publish_date}, Last played Date: #{game.played_at_date}"
      end
    end
  end

  def find_existing_author(first_name, last_name)
    existing_author = nil

    @authors.each do |author|
      if author.first_name == first_name && author.last_name == last_name
        existing_author = author
        break
      end
    end

    existing_author
  end

  def display_msg
    puts ' ✅ Game Added Successfully'
    puts '===================================================================================================='
  end

  def continue_option
    puts 'Do you want to add another item(y/n): '
    gets.chomp.downcase
  end
end
