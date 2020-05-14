class Song

  attr_accessor :name, :artist, :genre
  
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.all
    @@all
  end
  
<<<<<<< HEAD
  def self.destroy_all
=======
  def self.desstroy_all
>>>>>>> fe5ffc1e0649b64c185134fa3e23af2248e5194d
    @@all.clear
  end
  
  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end
  end

<<<<<<< HEAD



=======
>>>>>>> fe5ffc1e0649b64c185134fa3e23af2248e5194d
  def self.new_from_filename(file_name)
    file_bits = file_name.gsub(/(\.mp3)/,'')
    file_bits = file_bits.split(" - ")
    artist = Artist.find_or_create_by_name(file_bits[0])
    genre = Genre.find_or_create_by_name(file_bits[2])
    song = Song.find_or_create_by_name(file_bits[1])
    song.genre = genre
    song.artist = artist
    song
  end

  def self.create_from_filename(file_name)
    file = Song.new_from_filename(file_name)
    file.save
    file
  end

  def self.find_by_name(song_name)
    self.all.find {|song|song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song == nil
      self.create(song_name)
    else
      song
    end
  end

end