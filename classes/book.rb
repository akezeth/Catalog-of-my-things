require_relative 'item'

class Book < Item
    attr_accessor :publisher, :cover_state

    def initialize(params)
        @publisher = params[:publisher]
        @cover_state = params[:cover_state]
        super(params)
    end
end