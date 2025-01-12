class Genre
  extend Concerns::Findable

  attr_reader :songs
  attr_accessor :name

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.genre = self unless song.genre
    songs << song unless songs.include?(song)
  end

  def artists
    songs.map{ |song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end