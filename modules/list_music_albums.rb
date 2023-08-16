module ListMusicAlbums
  def list_all_musicAlbums
    @music_albums.each_with_index do |music, index|
      genre_name = music.genre ? music.genre.name : 'N/A'
      puts "#{index + 1}) Publish Date: #{music.publish_date}] Genre: #{genre_name}, On Spotify: #{music.on_spotify}"
    end
  end
end
