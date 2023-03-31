require_relative '../src/music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new('2003-05-03', on_soundcloud: true)
  end

  context 'testing #can_be_archived?' do
    let(:album) { MusicAlbum.new('2012-01-01', on_soundcloud: false) }
    let(:album_two) { MusicAlbum.new('2012-01-01', on_soundcloud: true) }

    it 'return true if on_soundcloud true' do
      result = album_two.send(:can_be_archived?)
      expect(result).to eq true
    end

    it 'return false of on_soundcloud false' do
      result = album.send(:can_be_archived?)
      expect(result).to eq false
    end

  end
end
