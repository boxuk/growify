class Plant < ActiveRecord::Base

	has_many :todos
	belongs_to :user
	
end
