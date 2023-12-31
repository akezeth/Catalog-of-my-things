module ListGenres
  def list_all_genres
    if @genres.empty?
      puts 'No genres available!'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}) #{genre.name}"
      end
    end
  end
end
