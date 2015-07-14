# == Schema Information
#
# Table name: parties
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  party_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Party < ActiveRecord::Base
  has_many :inventory_items
  has_many :transactions
  has_and_belongs_to_many :guests, join_table: "guests_parties", association_foreign_key: 'guest_id', class_name: "User"
end
