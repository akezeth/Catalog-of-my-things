require 'json'

module LoadGameAndAuthorData
  # Load Authors------------------------
  def load_authors
    return [] unless File.exist?('data/authors.json')

    authors_data = JSON.parse(File.read('data/authors.json'))
    authors_data.each do |author_data|
      author = Author.new(first_name: author_data['first_name'], last_name: author_data['last_name'])
      author.id = author_data['id']

      @authors << author
    end
  end

  # Load Games----------------------------
  def load_games
    return unless File.exist?('data/games.json')

    games_data_json = File.read('data/games.json')

    games_data = JSON.parse(games_data_json, symbolize_names: true)
    games_data.each do |game_data|
      game = Game.new(
        publish_date: game_data[:publish_date],
        multiplayer: game_data[:multiplayer],
        played_at_date: game_data[:played_at_date]
      )

      @games << game
    end
  end
end
