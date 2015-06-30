# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  price       :decimal(5, 2)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
	before_validation	 :capitalize_name

	def capitalize_name
		self.name = self.name.split.map(&:capitalize).join(' ')
	end
	
	def name_price
		"#{name} - R$#{price}"
	end
end
