class System < ActiveRecord::Base
	has_many :nav_entries
	
  validates :name, :presence => true  
	validates :version, :presence => true, 
		:uniqueness => {:scope => :name}
	
end
