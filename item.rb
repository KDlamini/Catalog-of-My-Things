# create item class
class Item
  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end
end
