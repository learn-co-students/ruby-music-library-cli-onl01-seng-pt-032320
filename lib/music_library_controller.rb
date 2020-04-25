class MusicLibraryController
    attr_reader :path

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(@path).import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input = gets
        until input == 'exit'
            case input
            when "list songs"
                list_songs
            when "list genres"
                list_genres
            when "list artists"
                list_artists
            when "list artist"
                list_songs_by_artist
            when "list genre"
                list_songs_by_genre
            when "play song"
                play_song
            end
            
            input = gets
        end
    end

    def list_songs
        Song.all.sort_by! {|song| song.name}.each_with_index {|song, i| puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
        Artist.all.sort_by! {|artist| artist.name}.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
    end

    def list_genres
        Genre.all.sort_by! {|genre| genre.name}.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        a_name = gets
        artist = Artist.find_by_name(a_name)
        if artist != nil
            artist.songs.sort_by! {|song| song.name}.each_with_index {|song, i| puts "#{i +1}. #{song.name} - #{song.genre.name}"}
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        g_name = gets
        genre = Genre.find_by_name(g_name)
        if genre != nil
            genre.songs.sort_by! {|song| song.name}.each_with_index {|song, i| puts "#{i +1}. #{song.artist.name} - #{song.name}"}
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        number = gets.to_i
        songs = Song.all.sort_by! {|song| song.name}
        if !(number > songs.length) && !(number < 1)
            puts "Playing #{songs[number-1].name} by #{songs[number-1].artist.name}"
        end
    end
end