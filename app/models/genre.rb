class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    artist_list = []
    self.songs.each do |song|
      artist_list << song.artist.name
    end
    artist_list.uniq.count
  end

  def all_artist_names
    artist_list = []
    self.songs.each do |song|
      artist_list << song.artist.name
    end
    artist_list.uniq
  end
end
