class MusicImporter 
 
  attr_accessor :path, :files 
  
  def initialize(path)
    @path = path 
    
  end 
  
  def files 
    @files = Dir.entries(@path).select {|song| song.end_with?(".mp3")}
  end 
  
  def import 
    files.each {|filename| Song.create_from_filename(filename)}
  end 
  

end 