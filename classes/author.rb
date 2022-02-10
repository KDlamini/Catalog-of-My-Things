require_relative 'item'

class Author < Item
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name, last_name)
    super()
    @id = Random.rand(1..10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(instance)
    @items << instance
    instance.author = self
  end
end
