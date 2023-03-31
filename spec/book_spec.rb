require_relative '../src/items'
require_relative '../src/book'

describe Book do
  before :each do
    @book = Book.new('2022-12-20', 'Richard Doe', 'bad')
  end

  describe '#new' do
    it 'return instance of book' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '< Item' do
    it 'Inherit from item class' do
      expect(Book).to be < Item
    end
  end

  describe '#move_to_archive' do
    it 'return true' do
      @book.move_to_archive
      expect(@book.archived).to be true
    end
  end
end
