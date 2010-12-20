class NavEntry < ActiveRecord::Base
	belongs_to :system
	belongs_to :parent, :class_name => "NavEntry"
	
	has_many :children, :class_name => "NavEntry",
		:foreign_key => "parent_id"
	
	validates :system, :presence => true
	validates :seq, :presence => true, 
		:uniqueness => {:scope => :parent_id}
	validates :content, :presence => true, 
		:uniqueness => {:scope => :parent_id}
end
