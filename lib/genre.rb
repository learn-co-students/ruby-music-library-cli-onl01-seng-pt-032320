class Genre 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_obj)
    genre_obj = Genre.new(name)
    @@all << self
    genre_obj
  end
    
    
end