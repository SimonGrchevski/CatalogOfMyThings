require_relative 'spec_helper'

title = 'Black label'
color = 'black'

describe Label do
  before :each do
    @label = Label.new(title, color)
  end

  describe '| Label instance ' do
    it '# Should return a Label instance' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe '| Title ' do
    it "# Should return #{title} for a title " do
      expect(@label.title).to eq(title)
    end
  end

  describe '| Color ' do
    it "# Should return #{color} for the color " do
      expect(@label.color).to eq(color)
    end
  end

  describe '| Add item' do
    let(:new_item) { Item.new({ publish_date: '1999/01/03', archived: false }) }
    it 'Should add the item' do
      @label.add_item(new_item)
      expect(@label.items.first).to eq(new_item)
    end
  end

  describe '| Add second item' do
    let(:second_item) { Item.new({ publish_date: '2020/03/05', archived: true }) }
    it 'Should be last item in the items' do
      @label.add_item(second_item)
      expect(@label.items.last).to eq(second_item)
    end
  end
end
