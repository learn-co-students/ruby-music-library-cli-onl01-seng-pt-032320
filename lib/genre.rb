class Genre < Artist
  extend Concerns::Findable
  
  def artists
    songs.collect {|song| song.artist}.uniq
  end
  
  
end