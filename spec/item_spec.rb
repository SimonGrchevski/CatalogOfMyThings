require_relative 'spec_helper'

describe Item do
  let(:item) { Item.new({ publish_date: '2020-09-01', archived: true }) }
  describe '#move_to_archive' do
    item1 = Item.new({ publish_date: '2019-09-01', archived: true })
    context 'when published less than 10 years' do
      it 'cannot be archived' do
        item1.move_to_archive
        expect(item1.archived).to be_falsey
      end
    end

    context 'when published over 10 years' do
      item2 = Item.new({ publish_date: '2001-09-01', archived: true })
      item2.move_to_archive
      it 'can be archived' do
        expect(item2.archived).to be_truthy
      end
    end
  end

  describe '#add_author' do
    it 'should add an author' do
      item.add_author Author.new('Simon', 'Mo')
      expect(item.author).to be_an_instance_of Author
    end
  end

  describe '#add_label' do
    it 'should add a label' do
      item.add_label Label.new('Gift', 'green')
      expect(item.label).to be_an_instance_of Label
    end
  end
end
