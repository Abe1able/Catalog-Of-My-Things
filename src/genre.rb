require_relative './item'

class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.add_genre(self)
    @items << item unless @items.include?(item)
  end
end
