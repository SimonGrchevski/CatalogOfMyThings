require_relative '../genre'
require_relative '../item'

describe 'Genre' do
  before :each do
    @genre = Genre.new(name: 'hard rock')
  end

  describe '#initialize' do
    it 'create a new genre with id,name and items ' do
      expect(@genre).to be_an_instance_of Genre
    end

    it 'rais an error if  genre\'s name is not provided' do
      expect { Genre.new }.to(raise_error)
    end
  end

  describe 'add_items' do
    it 'should add the item to the genre\'s items' do
      first_item = Item.new({})
      @genre.add_item(first_item)
      expect(@genre.items.first).to eq(first_item)
    end

    describe ' adding the genre to the item ' do
      context 'when no genre is set to the item ' do
        it 'add the genre to the item ' do
          item = Item.new({})
          @genre.add_item(item)
          expect(item.genre).to eq(@genre)
        end
      end
    end
  end
end
