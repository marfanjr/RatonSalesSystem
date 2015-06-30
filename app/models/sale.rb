# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  user_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :product

  #TODO: setar user como current user

  before_validation :cash_client_credits
  before_validation :set_user
  before_destroy :reverse_client_credits

  def cash_client_credits
    unless self.client.presence
      errors.add(:client_id, "client not found.") 
      return       
    end 
  	if self.client.profile.credits < self.product.price
  		errors.add(:credits, "client uncredited available") 
  		return
  	end
  	self.client.profile.credits = self.client.profile.credits - self.product.price
  	self.client.profile.save
  end

  def reverse_client_credits
    self.client.profile.credits = self.client.profile.credits + self.product.price
    self.client.profile.save
  end
  def set_user
    self.user = SessionGateway.user
  end
end
