class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(params)
    @id = rand(1..100_000)
    @items = []
    @title = params[:title]
    @color = params[:color]
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_label(self)
  end
end
