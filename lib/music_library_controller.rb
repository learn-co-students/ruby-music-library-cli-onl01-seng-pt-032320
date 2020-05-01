require 'pry'
class MusicLibraryController
  def initialize (path = './db/mp3s')
    file = MusicImporter.new(path)
    file.import
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
    if input == "list songs"
      list_songs
    elsif input == "list artists" 
      list_artists
    elsif input == "list genres" 
      list_genres
    elsif input == "list artist" 
      list_songs_by_artist
    elsif input == "list genre" 
      list_songs_by_genre
    elsif input == "play song" 
      play_song
    elsif input == "exit"
    else 
      call 
    end 
  end 
  
  def list_songs
    list = Song.all
    list.sort! { |a,b| a.name <=> b.name }
    list.each do |song|
      #binding.pry
      number = list.index(song) + 1
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    list = Song.all
    list.sort! { |a,b| a.artist.name <=> b.artist.name }
    list.each do |song|
      #binding.pry
      number = list.index(song) + 1
      puts "#{number}. #{song.artist.name}"
    end
  end 
  
  def list_genres
  end 
  
  def list_songs_by_artist
  end 
  
  def list_songs_by_genre
  end 
  
  def play_song
  end 
  
end 