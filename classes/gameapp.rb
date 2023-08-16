require 'date'
require 'json'
require_relative 'author'
require_relative 'game'

class GameApp
  def initialize
    @authors = []
    @games = []
  end
#Load Authors------------------------
def load_authors
  return [] unless File.exist?('data/authors.json')
  authors_data = JSON.parse(File.read('data/authors.json'))
  authors_data.each do |author_data|
  author_data = Author.new(first_name:author_data['first_name'],last_name:author_data['last_name'])
  author.id =  author_data['id']
  @authors << author
  end
end
#Load Games----------------------------
    def load_games
        return unless File.exist?('data/games.json')
        games_data = JSON.parse(File.read('data/games.json'))
        games_data.each do |game_data|
        game_data = Game.new(
            publish_date:game_data[:publish_date],
            multiplayer:game_data[:multiplayer],
            played_at_date:game_data[:played_at_date]
        )
        @games << game
        end
    end
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
        print "#{index + 1}.Multiplayer: #{game.multiplayer} "
        puts "Publlish Date: #{game.publish_date} Last played Date: #{game.played_at_date}"
      end
    end
  end
  # Find existing authors-----------------------

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
