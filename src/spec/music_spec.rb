require_relative '../music_album'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new('2003-05-03', on_soundcloud: true)
  end

  context 'testing move_to_archive' do
    it 'return true if on_soundcloud true' do
      expect(@music_album.move_to_archive).to eq true
    end

    it 'return false of on_soundcloud false' do
      @music_album.on_soundcloud = false
      expect(@music_album.move_to_archive).to eq false
    end

    it 'set the archived variable to true' do
      @music_album.move_to_archive
      expect(@music_album.archived).to eq true
    end

    it 'set the archived variable to false' do
      @music_album.on_soundcloud = false
      @music_album.move_to_archive
      expect(@music_album.archived).to eq false
    end
  end
end
