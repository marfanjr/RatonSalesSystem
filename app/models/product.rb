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
	has_one :inventory_item

	before_validation	 :capitalize_name


	# after_save :set_profit_margin
    
    def set_profit_margin
        self.inventory_item.profit_margin = ((self.price/self.inventory_item.unit_cost) - 1)*100
        ap self.inventory_item.profit_margin
        self.inventory_item.save
    end

	def capitalize_name
		self.name = self.name.split.map(&:capitalize).join(' ')
	end
	
	def name_price
		"#{name} - R$#{price}"
	end
end
