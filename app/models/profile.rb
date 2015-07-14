# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  cpf          :string(255)
#  rg           :string(255)
#  telephone    :string(255)
#  cell_phone   :string(255)
#  email        :string(255)
#  credits      :decimal(5, 2)    default(0.0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  profile_type :integer
#

class Profile < ActiveRecord::Base
	# remover client
	has_one :client 
	has_one :user

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	# validates :cpf, uniqueness: true
	# validates :rg, uniqueness: true
	before_validation :capitalize_name

	enum profile_type: [:employee, :customer]

	def capitalize_name
		self.name = self.name.split.map(&:capitalize).join(' ')
	end


end

