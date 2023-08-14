require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
    @genre = params[:genre]
    @author = params[:author]
    @label = params[:label]
    @publish_date = params[:publish_date]
    @archived = params[:archived] || false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  private

  def can_be_archived?
    (Date.today - @publish_date).to_i / 365 > 10
  end

  def create_date(date_str)
    return nil if date_str.nil?

    Date.parse(date_str.to_s)
  end
end
