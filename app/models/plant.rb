

class Plant < ActiveRecord::Base

	has_many :todos
	belongs_to :user
	after_update :check_levels

	before_create :set_defaults


	def set_defaults
	  self.moisture_level = 0
	  self.temperature = 0
	  self.light_level = 0
	  self.humidity_level = 0
	end

	def check_levels
		if moisture_level < 400
			self.todos.create({message:'Water Me', priority:'high'})
		elsif moisture_level > 900
			self.todos.create({message:'Reduce Water Levels', priority:'high'})	
		end
		if Time.now.hour > 7 && Time.now.hour < 21 && light_level == 0
			self.todos.create({message:"Give Me More Light", priority:'low'})
		end
		if temperature <= 2 
			self.todos.create({message:"Warm Me Up", priority:'medium'})
		elsif temperature >= 40
			self.todos.create({message: "Cool Me Down", priority:'medium'})
		end
	end
end

