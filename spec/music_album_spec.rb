require_relative '../app/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new(on_spotify: true, publish_date: '2010-01-01')
  end

  it 'is an example of MusicAlbum and takes 2 parameter' do
    expect(@music).to be_instance_of(MusicAlbum)
  end

  it 'can_be_archived if it is avilable on spotify' do
    expect(@music.can_be_archived?).to eq(true)
  end

  it 'creates a new music album insance' do
    expect(@music.on_spotify).to eq(true)
  end
end
