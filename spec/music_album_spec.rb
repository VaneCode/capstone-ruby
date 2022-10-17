require_relative '../app/music_album'

describe MusicAlbum do
   before :each do
    @music = MusicAlbum.new('2010-01-01', true)
  end

  it 'is an example of MusicAlbum and takes 3 parameter' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end

  
end