class Client < ActiveRecord::Base
  belongs_to :profile
  accepts_nested_attributes_for :profile

  def profile_name
  	profile.name 
  end
end
