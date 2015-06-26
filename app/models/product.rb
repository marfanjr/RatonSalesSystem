class Product < ActiveRecord::Base
	before_validation	 :capitalize_name

	def capitalize_name
		self.name = self.name.split.map(&:capitalize).join(' ')
	end
	
	def name_price
		"#{name} - R$#{price}"
	end
end
