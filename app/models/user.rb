# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  profile_id             :integer
#  role                   :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, presence: true
  belongs_to :profile, dependent: :destroy
  has_many :transactions, foreign_key: 'employee_id'
  has_many :transactions, foreign_key: 'customer_id'

  accepts_nested_attributes_for :profile


  # before_create :randomize_id

  before_validation :set_user_email

  enum role: [:employee, :customer]

  def email_required?
  	false  	
  end

  def set_user_email
  	self.email = self.profile.email
  end

  
private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end

end
