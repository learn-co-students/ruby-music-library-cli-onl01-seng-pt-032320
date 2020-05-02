module Concerns::Findable
    def find_by_name(obj_name)
        self.all.find {|obj| obj.name == obj_name}
    end

    def find_or_create_by_name(obj_name)
        if !self.find_by_name(obj_name)
            self.create(obj_name)
        else
            self.find_by_name(obj_name)
        end
    end
end