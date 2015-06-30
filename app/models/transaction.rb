# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  customer_id :integer
#  party_id    :integer
#  quantity    :decimal(5, 2)
#  value       :decimal(5, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#

class Transaction < ActiveRecord::Base
  belongs_to :employee, class_name: "User"
  belongs_to :customer, class_name: "User"
  belongs_to :product
  belongs_to :party

  before_validation :cash_customer_credits
  before_validation :set_employee
  before_validation :set_value
  before_validation :update_inventory_item
  before_destroy :reverse_customer_credits

  def set_value
    self.value = self.quantity * self.product.price
  end

  def update_inventory_item
    i = self.party.inventory_items.find_by(product_id: self.product_id)
    i.amount_sold = i.amount_sold + 1
    i.save
  end

  def cash_customer_credits
    unless self.customer.presence
      errors.add(:employee_id, "customer not found.") 
      return       
    end 
    ap product_id
  	if self.customer.profile.credits < self.product.price
  		errors.add(:credits, "customer uncredited available") 
  		return
  	end
  	self.customer.profile.credits = self.customer.profile.credits - self.product.price
  	self.customer.profile.save
  end

  def reverse_customer_credits
    self.customer.profile.credits = self.customer.profile.credits + self.product.price
    self.customer.profile.save
  end
  def set_employee
    self.employee = SessionGateway.user
  end
end
