class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
    @genre = params[:genre]
    @author = params[:author]
    @source = params[:source]
    @label = params[:label]
    @publish_date = params[:publish_date]
    @archived = params[:archived] || false
  end

  private

  def can_be_archived?
    return true if (Date.today - @publish_date).to_i / 365 > 10

    false
  end

  def create_date(date_str)
    return nil if date_str.nil?

    Date.parse(date_str.to_s)
  end
end
