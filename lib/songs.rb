
class Song

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artists = nil, genres = nil )
    @name = name
    if artists != nil
      self.artist = artists
    end

    if genres != nil
      self.genre = genres
    end

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
  song_name = filename.split("-")[1].strip
  artist = filename.split("-")[0].strip
  genre = filename.split("-")[2].split(".")[0].strip
  new_song = Song.new(song_name)
  new_song.artist_name(artist)
  new_song.genre_name = genre
  new_song
  end

  def artist_name(name)
  #  Artist.find_or_create_by_name(name)
    knew = Artist.find_by_name(name)
    if !Artist.all.include?(knew)
      self.artist = Artist.new(name)
   end
      self.artist.name
  end

  def genre_name=(name)
  #  Genre.find_or_create_by_name(name)
      self.genre = Genre.new(name)
      self.genre.name
  end

  def self.create_from_filename
    # does the same thing as .new_from_filename but also saves the newly-created song to the @@all class variable.
  end
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end



end
