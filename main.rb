def app_intro
  puts 'Welcome to Catalog of my things!'
  loop do
    display_options
    option = user_input
    if option >= 1 && option < 7
      option_methods_till6(option)
    else
      option_methods_above6(option)
    end

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
  puts option
  option
end

def option_methods_till6(option)
  case option
  when 1 then list_all_books
  when 2 then list_all_musicAlbums
  when 3 then list_of_games
  when 4 then list_all_genres
  when 5 then list_all_labels
  when 6 then list_all_authors
  else
    exit_app
  end
end

def option_methods_above6(option)
  case option
  when 7 then add_book
  when 8 then add_musicAlbum
  when 9 then add_game
  else
    exit_app
  end
end

def exit_app
  puts 'Thank you for using this app!'
  exit
end

app_intro
