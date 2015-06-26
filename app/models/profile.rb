class Profile < ActiveRecord::Base
	has_one :client
	has_one :user

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :cpf, presence: true, uniqueness: true
	validates :rg, presence: true, uniqueness: true

	before_validation	 :capitalize_name

	def capitalize_name
		self.name = self.name.split.map(&:capitalize).join(' ')
	end
	
  
end

