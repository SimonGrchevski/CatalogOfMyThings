require_relative 'spec_helper'

publisher = 'Penguin Books'
cover_state = 'bad'

describe Book do
  before :each do
    @book = Book.new(publisher, cover_state,{publish_date: '1999/03/01', archived: true})
  end

  describe '| Book instance' do
    it '# Should return a book instance' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '| publisher' do
    it '# Should return the correct publisher' do
      expect(@book.publisher).to eq(publisher)
    end
  end

  describe '| Cover state' do
    it "# The cover_state should be #{cover_state}" do
      expect(@book.cover_state).to eq(cover_state)
    end
  end

  describe '| Can not be archived' do
    it '# The book should not be archived' do
      expect(@book.archived).to be_truthy
    end
  end
  
  describe '| Can be archived' do
    let(:unArchived) {Book.new(publisher, cover_state,{publish_date: '2020/01/01', archived: false})}
    it '# The book should be archived' do
      expect(unArchived.archived).to be_falsey
    end
  end
end
