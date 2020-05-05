require "pry"
class MusicImporter
    attr_reader :path 
    def initialize(path)
        @path = path 
    end

    def files
        Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '') }
       # binding.pry

        # Dir.glob("#{path}/*").map do |file| 
        #     file.gsub("#{path}/", '') 
    end

        def import  
            files.each { |file| Song.create_from_filename(file)}
        end
end