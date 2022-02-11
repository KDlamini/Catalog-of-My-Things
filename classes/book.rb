require_relative 'item'

# Create class Book
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def book_info
    "Publisher\'s name : \"#{@publisher}\"\n
    Published on : #{@publish_date}\n
    Cover state: #{cover_state}"
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
