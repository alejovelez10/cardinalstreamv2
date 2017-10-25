class Stat < ApplicationRecord
	before_create :hola

	def hola

		self.time_stat = self.time_stat - 5*3600
		
	end
end
