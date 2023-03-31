require_relative '../item'
require_relative '../genre'

describe Genre do
  before(:each) do
    @item = Item.new('2022-03-12')
  end

  context 'when initialized' do
    it 'add an item to genre' do
      genre = Genre.new('Rock')
      expect(genre.items.length).to eq 0
      genre.add_item(@item)
      expect(genre.items.length).to eq 1
    end
  end
end
