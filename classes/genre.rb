class Genre
  def initialize(params)
    @id = params[:id] || rand(1..1000)
    @name = params[:name]
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre = self
  end
end