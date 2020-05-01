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



end
