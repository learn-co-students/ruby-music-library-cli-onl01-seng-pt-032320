class MusicLibraryController
  
  
  attr_accessor :path 
def initialize(path="./db/mp3s/")  
  
imported_songs = MusicImporter.new(path)
end 
end 