module ListGenres
  def list_all_genres
    @genres.each_with_index do |genre, index|
      puts '#{index + 1}) #{genre.name}'
    end
  end
end
