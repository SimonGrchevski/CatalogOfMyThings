require_relative '../music_album'

describe 'MusicAlbum' do
  before :each do
    @album = MusicAlbum.new(
      true,
      { publish_date: '1990/01/01', archived: true }
    )
  end

  describe '#initialize' do
    it 'create a new Album instance ' do
      expect(@album).to be_an_instance_of MusicAlbum
    end

    describe '#move_to_archive' do
      context 'album is on spotify' do
        context 'release year is older than 10 years' do
          it 'should return true' do
            expect(@album.move_to_archive).to eq(true)
          end
        end
        context 'release year is less than 10 years' do
          it 'should return False' do
            new_album = MusicAlbum.new(
              true,
              { publish_date: '2020/01/01' }
            )
            expect(new_album.move_to_archive).to eq(false)
          end
        end
      end

      context 'album is Not on spotify ' do
        it 'should returns false in all cases' do
          new_album = MusicAlbum.new(
            false,
            { publish_date: '2020/01/01' }
          )
          expect(new_album.move_to_archive).to eq(false)
        end
      end
    end
  end
end
