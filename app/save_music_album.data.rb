require 'json'

module SaveData
  def save_music(music)
    save_music = []
    music.each do |song|
      save_music << { 'publish_date' => song.publish_date, 'on_spotify' => song.on_spotify }
    end

    File.write('./data/musics.json', JSON.generate(save_music))
  end

end