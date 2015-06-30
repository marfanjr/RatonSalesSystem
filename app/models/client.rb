# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  profile_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  belongs_to :profile
  accepts_nested_attributes_for :profile

  def profile_name
  	profile.name 
  end
end
