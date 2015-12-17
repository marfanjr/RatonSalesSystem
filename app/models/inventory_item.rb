# == Schema Information
#
# Table name: inventory_items
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  party_id         :integer
#  amount_purchased :integer
#  unit_cost        :decimal(5, 2)
#  total_cost       :decimal(5, 2)
#  profit_margin    :decimal(5, 2)
#  amount_sold      :decimal(5, 2)    default(0.0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  msrp             :decimal(5, 2)
#

class InventoryItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :party

  after_save :set_msrp
  after_save :set_total_cost


  def set_msrp
  	self.product.price = self.unit_cost + (self.unit_cost * profit_margin)/100
  	self.product.save

  	self.msrp = self.unit_cost + (self.unit_cost * profit_margin)/100
  end

  def set_total_cost
	self.total_cost = self.unit_cost*self.amount_purchased
  end

end
