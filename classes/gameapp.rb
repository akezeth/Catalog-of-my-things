require 'date'
require 'json'
require_relative 'author'
require_relative 'game'

class GameApp
    def initialize 
        @authors = []
        @games = []
    end
 def add_author (authors, full_params)
    

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
 #Add games 
 def add_game 
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
        puts "==== ✅ Game Added Successfully===="
 end  
end