require 'json'

module SaveData
  def save_music(music)
    save_music = []
    music.each do |song|
      save_music << { 'publish_date' => song.publish_date, 'on_spotify' => song.on_spotify }
    end

    File.write('./data/musics.json', JSON.generate(save_music))
  end

  def save_genre(genres)
    save_genres = []
    genres.each do |genre|
      save_genres << { 'name' => genre.name }
    end

    File.write('./data/genres.json', JSON.generate(save_genres))
  end
end
