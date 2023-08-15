class Genre
  attr_accessor :id, :items, :name

  def initialize(params)
    @id = params[:id] || rand(1..1000)
    @name = params[:name]
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
  end
end
