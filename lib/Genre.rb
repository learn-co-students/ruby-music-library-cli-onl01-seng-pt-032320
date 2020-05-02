class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(genre_name)
        self.name = genre_name
        self.songs = []
    end

    def save
        @@all << self
    end

    def self.create(genre_name)
        newgenre = Genre.new(genre_name)
        newgenre.save
        newgenre
    end

    def add_song(song_obj)
        (song_obj.genre = self) if !song_obj.genre
        (self.songs << song_obj) if !self.songs.include?(song_obj)
    end

    def artists
        all_artists = songs.collect {|song| song.artist}
        all_artists.uniq
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end
end