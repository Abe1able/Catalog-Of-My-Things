require_relative '../src/label'
require_relative '../src/items'

describe Label do
  before :each do
    @label = Label.new('Warcraft: Day of the Dragon', 'Richard A. Kannak')
  end

  describe '#new' do
    it 'should take two arguments and create a Label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe '#add_item' do
    it 'should return a non-empty items array' do
      item = Item.new('2001-01-16')
      @label.items << item
      expect(@label.items.empty?).to be false
    end
  end
end
