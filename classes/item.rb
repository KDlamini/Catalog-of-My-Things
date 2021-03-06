require 'date'

# create item class
class Item
  attr_accessor :publish_date
  attr_reader :id, :label, :author, :genre

  def initialize(publish_date)
    @id = Random.rand(1..10_000)
    @genre = nil
    @author = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def genre=(new_genre)
    @genre = new_genre
    new_genre.add_item(self) unless new_genre.items.include?(self)
  end

  def author=(new_author)
    @author = new_author
    new_author.add_item(self) unless new_author.items.include?(self)
  end

  def label=(new_label)
    @label = new_label
    new_label.add_item(self) unless new_label.items.include?(self)
  end

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10)
    Date.today > archived_date
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
