require_relative 'music_album'
class Genre
	attr_reader :name, :items

	def initialize(name)
		@id = Random.new.rand(1..1000)
		@name = name
		@items = []
	end

	def add_item(item)
		@items.push(item)
		item.genre = self
	end
end
