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
        return [] unless File.exist('data/authors.json')
        authors_data = JSON.parse(File.read('data/authors.json'))
        authors_data.each do |author_data|
        author_data = Author.new(first_name:author_data['first_name'],last_name:author_data['last_name'])
        author.id =  author_data['id']
        @authors << author
        end
    end
#Load Games----------------------------
    def load_games
        return unless File.exist('data/games.json')
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

#Save Authors-------------------------
    def save_authors
        File.open('data/authors.json', 'w') do |file|
        File.write('data/authors.json', JSON.pretty_generate(@authors.map(&:to_hash)))
    end
    puts "Author data saved successfully"
    rescue StandardError => e
        puts "Error saving author data: #{e.message}"
    end
#Save Game-----------------------------
    def save_games
        File.open('data/games.json', 'w') do |file|
        File.write('data/games.json', JSON.pretty_generate(@games.map(&to_hash)))
        end
        puts "Game Data saved successfully"
        rescue StandardError => e
        puts "Error Saving game data: #{e.message}"
    end
#Add authors-----------------------------
 def add_author
    puts "Type the Author [First Name]: "
    first_name = gets.chomp
    puts "Type the Author [Last Name]: "
    last_name = gets.chomp
    existing_author = find_existing_author(authors,first_name,last_name)
    if existing_author
        puts "Existing author found"
        author = existing_author
    else
        puts "Creating author..."
        author = Author.new(first_name:first_name, last_name:last_name)
        authors << author
    end
    author
 end 
 #Add games-------------------------------
 def add_game 
   puts "Adding a Game"
puts "===================================================================================================="
    puts "Type the Game [publish date] (yyyy-mm-dd):"
    publish_date = Date.parse(gets.chomp)
    puts "Type if Game is [multiplayer] (y/n)?: "
    multiplayer = gets.chomp.downcase =='y'
    puts "Type when the Game was [last played at] (yyyy-mm-dd): "
    last_played_date = Date.parse(gets.chomp)
    game = Game.new(
        publish_date:publish_date,
        multiplayer: multiplayer,
        played_at_date: last_played_date
        )
        author.add_item(game)
        @games << game
        
        puts " ✅ Game Added Successfully"
        puts "===================================================================================================="

 end  
 #List all authors-----------------------
 def list_all_authors
    if @authors.empty?
        puts "❌ Authors Not Found"
    else
        puts "👨 List of Authors: "
        authors.each do |author|
            puts "ID:#{author.id} Fullname: #{author.first_name} #{author.last_name}"
        end
    end
 end
#List all Games-----------------------
 def list_all_games
    if @games.empty?
        puts "❌ Games Not Found"
    else 
        puts "🎮 List of Games:"
        @games.each do |game, index|
            puts "#{index + 1}. Publlish Date: #{game.publish_date}" 
            print "Multiplayer: #{game.multiplayer} Last played Date: #{game.last_played_date}"
        end
    end
 end
 #Find existing authors-----------------------

 def find_existing_author(first_name, last_name)
    existing_author = nil
    @authors.each do |author|
        if(author.first_name==first_name && author.last_name==last_name)
            existing_author = author
            break
        end
    end 
    existing_author
 end
end