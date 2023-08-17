require_relative 'app'

def app_intro
  puts 'Welcome to Catalog of my things!'
  app = App.new
  loop do
    display_options
    option = user_input
    app.option_methods(option)

    break if option == 10
  end
end

def display_options
  puts 'Please choose one of the options: '
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List of games'
  puts '4 - List all genres'
  puts '5 - List all labels'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Exit'
end

def user_input
  print 'Enter a number: '
  option = gets.chomp.to_i
  until option >= 1 && option <= 10
    puts 'Please enter a number between 1 and 10'
    print 'Enter a number: '
    option = gets.chomp.to_i
  end
  option
end

app_intro
