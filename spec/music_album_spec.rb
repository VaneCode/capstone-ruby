require_relative '../app/music_album'

describe MusicAlbum do
   before :each do
    @music = MusicAlbum.new('2010-01-01', true)
  end

  it 'is an example of MusicAlbum and takes 3 parameter' do
      expect(music_album).to be_instance_of(MusicAlbum)
    end

  it 'can be archived if the date of publish is the same' do
    @music_album = MusicAlbum.new('2018-01-01', true)
    expect(@music_album.can_be_archived?).to be false
  end 

 it 'can_be_archived if it is avilable on spotify' do
      expect(music_album3.can_be_archived?).to eq(false)
    end
   

end