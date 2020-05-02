class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(artist_name)
        self.name = artist_name
        self.songs = []
    end

    def save
        @@all << self
    end

    def self.create(artist_name)
        newartist = Artist.new(artist_name)
        newartist.save
        newartist
    end

    def add_song(song_obj)
        (song_obj.artist = self) if !song_obj.artist
        (self.songs << song_obj) if !self.songs.include?(song_obj)
    end

    def genres
        all_genres = songs.collect {|song| song.genre}
        all_genres.uniq
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end
end