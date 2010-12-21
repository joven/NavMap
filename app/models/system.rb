class System < ActiveRecord::Base
	has_many :nav_entries
	
  validates :name, :presence => true  
	validates :version, :presence => true, 
		:uniqueness => {:scope => :name}
	
    def roots
      self.nav_entries.where("parent_id IS NULL").order("seq ASC")
    end
    
end
