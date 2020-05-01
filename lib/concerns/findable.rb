module Concerns::Findable
  def find_by_name (namex)
    self.all.find { |x| x.name == namex}
  end
  
  def find_or_create_by_name (namex)
    if (self.find_by_name (namex))
      self.all.uniq!
      self.find_by_name (namex)
    else 
      self.create(namex)
    end 
  end 
end 