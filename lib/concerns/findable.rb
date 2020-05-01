module Concerns::Findable 

def find_by_name(song)
    @@all.detect { |song| song.name == name }
  end
  
  def find_or_create_by_name(name)
   self.find_by_name || self.create(name) 
 end
 
 end 