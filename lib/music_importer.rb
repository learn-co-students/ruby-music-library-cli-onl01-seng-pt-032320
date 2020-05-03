require "pry"
class MusicImporter
  attr_accessor :path



  def initialize(path)
    @path = path

  end


  def files
    file_array = Dir.glob("#{path}/*.mp3")
    file_array.collect do |file|
      file.slice!("#{path}/")
      file
    
    end
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end


end
