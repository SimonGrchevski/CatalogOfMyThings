require_relative 'spec_helper'

describe Author do
  let(:author) { Author.new('Sun', 'Tzu') }
  describe '#new' do
    it 'should return an instance of Author' do
      expect(author).to be_an_instance_of Author
    end
    it 'should have items attribute' do
      expect(author).to have_attributes(items: [])
    end
  end

  describe '#first_name' do
    it 'should return Sun' do
      expect(author.first_name).to eq 'Sun'
    end
    it 'should respond to first_name' do
      expect(author).to respond_to(:first_name)
    end
  end

  describe '#last_name' do
    it 'should return Tzu' do
      expect(author.last_name).to eq 'Tzu'
    end
    it 'should respond to last_name' do
      expect(author).to respond_to(:last_name)
    end
  end

  describe '#add_item' do
    let(:item) { Item.new({ publish_date: '2020-01-04', archived: true }) }
    it 'should add an item' do
      author.add_item item
      expect(author.items).to include(item)
      expect(author.items.size).to be > 0
      expect(author.items[0]).to eq item
    end
  end
end
