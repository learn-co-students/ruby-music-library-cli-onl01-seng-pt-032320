require 'pry'

class MusicLibraryController
    attr_accessor :path

    def initialize(path="./db/mp3s")
        @path = path
        MusicImporter.new(@path).import
        @songs_list = []
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
  
          input = gets.strip.downcase

          while input != "exit"
            if input == "list songs"
              self.list_songs
            elsif input == "list artists"
              self.list_artists
            elsif input == "list genres"
              self.list_genres
            elsif input == "list artist"
              self.list_songs_by_artist
            elsif input == "list genre"
              self.list_songs_by_genre
            elsif input == "play song"
              self.play_song
            else
              # idk lol
            end
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?" 
            input = gets.strip.downcase
          end
          # End of WHILE LOOP
    end

    def list_songs
        songs = Song.all.sort_by(&:name)
        songs_list = []
        
        songs.each do |song|
            songs_list << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end

        songs_list.each.with_index(1) do |song, ind|
        puts "#{ind}. #{song}"
        end
    end

    def list_artists
        Artist.all.sort_by(&:name).each.with_index(1) do |artist, ind|
        puts "#{ind}. #{artist.name}"
        end
    end

    def list_genres
        Genre.all.sort_by(&:name).each.with_index(1) do |genre, ind|
        puts "#{ind}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        final_list = []
        puts "Please enter the name of an artist:"
        input = gets.strip
        the_artist = Artist.all.find {|artist| artist.name == input}

        if (the_artist)
        song_list = the_artist.songs.sort_by(&:name)
         song_list.each.with_index(1) do |song, ind|
         puts "#{ind}. #{song.name} - #{song.genre.name}"
         end
        end
    end

    def list_songs_by_genre
        final_list = []
        puts "Please enter the name of a genre:"
        input = gets.strip
        the_genre = Genre.all.find {|genre| genre.name == input}

        if (the_genre)
        song_list = the_genre.songs.sort_by(&:name)
         song_list.each.with_index(1) do |song, ind|
         puts "#{ind}. #{song.artist.name} - #{song.name}"
         end
        end
    end

    def play_song
        songs = Song.all.sort_by(&:name)
    
        puts "Which song number would you like to play?"
        input = gets.strip.to_i

        if input > 0 && input < songs.length
        puts "Playing #{songs[input - 1].name} by #{songs[input - 1].artist.name}"
        end
    end

end