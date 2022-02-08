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

  def can_be_archived?
    @publish_date > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
