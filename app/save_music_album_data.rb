require 'json'
require_relative 'genre'
require_relative 'music_album'

module SaveMusicData
  DATA_DIRECTORY = './data_json/'.freeze
  def self.write_music(music_albums)
    return if music_albums.empty?

    path_file = "#{DATA_DIRECTORY}music_albums.json"
    data = []
    music_albums.each do |album|
      album = {
        id: album.id,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        genre: { name: album.genre.name }
      }
      data << album
    end
    File.write(path_file, JSON.pretty_generate(data))
  end

  def self.read_music(music_albums)
    path = "#{DATA_DIRECTORY}music_albums.json"
    return unless File.exist?(path)

    music_file = File.open(path)
    JSON.parse(music_file.read).each do |music_album|
      album = MusicAlbum.new(publish_date: music_album['publish_date'],
                             on_spotify: music_album['on_spotify'],
                             id: music_album['id'])
      album.add_genre(Genre.new(music_album['genre']['name']))
      music_albums << album
    end
  end

  def self.write_genre(genres)
    return if genres.empty?

    path_file = "#{DATA_DIRECTORY}genres.json"
    data = []
    genres.each do |genre|
      genre = { id: genre.id, name: genre.name }
      data << genre
    end
    File.write(path_file, JSON.pretty_generate(data))
  end

  def self.read_genres(genres)
    path = "#{DATA_DIRECTORY}genres.json"
    return unless File.exist?(path)

    genres_file = File.open(path)
    JSON.parse(genres_file.read).each do |genre|
      genres << Genre.new(genre['name'], genre['id'])
    end
  end
end
