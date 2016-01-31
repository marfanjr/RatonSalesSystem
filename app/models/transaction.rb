# == Schema Information
#
# Table name: transactions
#
#  id            :integer          not null, primary key
#  employee_id   :integer
#  customer_id   :integer
#  party_id      :integer
#  quantity      :decimal(5, 2)
#  value         :decimal(5, 2)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  product_id    :integer
#  product_name  :string(255)
#  product_price :decimal(5, 2)
#

class Transaction < ActiveRecord::Base
  belongs_to :employee, class_name: "User"
  belongs_to :customer, class_name: "User"
  belongs_to :product
  belongs_to :party

  validates :quantity, presence:true
  
  before_validation :set_employee
  before_validation :set_transaction_attributes
  before_validation :update_inventory_item
  before_validation :cash_customer_credits
  before_destroy :reverse_customer_credits
  before_destroy :reverse_inventory_item

  def set_transaction_attributes
    self.product_name = self.product.name
    self.product_price = self.product.price
    self.value = self.quantity * self.product.price
  end

  def update_inventory_item
    i = self.party.inventory_items.find_by(product_id: self.product_id)
    i.amount_sold = i.amount_sold + self.quantity
    i.save
  end

  def reverse_inventory_item
    i = self.party.inventory_items.find_by(product_id: self.product_id)
    i.amount_sold = i.amount_sold - self.quantity
    i.save
  end

  def cash_customer_credits
    unless self.customer.presence
      errors.add(:employee_id, "customer not found.") 
      return       
    end 
  	if self.customer.profile.credits < (self.product.price * self.quantity)
  		errors.add(:credits, "customer uncredited available") 
  		return
  	end
  	self.customer.profile.credits = self.customer.profile.credits - (self.product.price * self.quantity)
  	self.customer.profile.save
  end

  def reverse_customer_credits
    self.customer.profile.credits = self.customer.profile.credits + (self.product.price * self.quantity)
    self.customer.profile.save
  end

  def set_employee
    self.employee = SessionGateway.user
  end
end
