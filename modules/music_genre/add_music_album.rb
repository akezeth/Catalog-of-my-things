module AddMusic
  def add_music
    publish_date = input_date
    on_spotify = input_on_spotify
    music_ablum = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    @music_albums << music_ablum
    genre = add_genre
    music_ablum.add_genre(genre)
    puts 'Music Album added successfully'
  end

  def input_date
    print 'Publish date: '
    Date.parse(gets.chomp)
  end

  def input_on_spotify
    print 'Is it on spotify [Y/N]: '
    on_spotify = gets.chomp.upcase
    until on_spotify.eql?('Y') || on_spotify.eql?('N')
      print 'Invalid input. Please enter the correct option [Y/N]: '
      on_spotify = gets.chomp.upcase
    end
    on_spotify == 'Y'
  end

  def add_genre
    puts 'Add Genre for the music album'
    print 'Enter the name of Genre: '
    name = gets.chomp
    @genres.each do |genre|
      return genre if genre.name.include?(name)
    end
    new_genre = Genre.new(name: name)
    @genres << new_genre
    new_genre
  end
end
