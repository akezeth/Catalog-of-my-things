require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(params)
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
    super(params)
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
