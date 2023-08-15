require 'date'
require 'json'
require_relative 'author'
require_relative 'game'

class GameApp
 def add_author (authors, full_params)
    first_name = full_params[:first_name]
    last_name = full_params[:last_name]
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
end