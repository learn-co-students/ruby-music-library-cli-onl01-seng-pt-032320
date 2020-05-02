require 'pry'

class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(song_name, artist_name=nil, genre_name=nil)
        self.name = song_name
        self.artist = artist_name
        self.genre = genre_name
    end

    def artist=(artist_obj)
        @artist = artist_obj
        (artist_obj.add_song(self)) if artist_obj
    end

    def genre=(genre_obj)
        @genre = genre_obj
        (genre_obj.add_song(self)) if genre_obj
    end

    def save
        @@all << self
    end

    def self.create(song_name)
        newsong = Song.new(song_name)
        newsong.save
        newsong
    end

    def self.find_by_name(song_name)
         self.all.find {|song| song.name == song_name}
     end

     def self.find_or_create_by_name(song_name)
         if !self.find_by_name(song_name)
             self.create(song_name)
         else
             self.find_by_name(song_name)
         end
    end

    def self.new_from_filename(file)
        song = self.new(file.split(" - ")[1])
        artist = file.split(" - ")[0]
        genre_pre = file.split(" - ")[2]
        genre = genre_pre.split(".")[0]
        song.artist = Artist.find_or_create_by_name(artist)
        song.genre = Genre.find_or_create_by_name(genre)
        song
    end

    def self.create_from_filename(file)
        self.new_from_filename(file).save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end
end