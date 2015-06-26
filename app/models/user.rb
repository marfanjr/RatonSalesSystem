class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :profile
  has_many :sales

  accepts_nested_attributes_for :profile

  before_validation :set_user_email

  def email_required?
  	false  	
  end

  def set_user_email
  	self.email = self.profile.email
  end
end
