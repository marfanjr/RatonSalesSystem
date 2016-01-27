# == Schema Information
#
# Table name: parties
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  party_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  ticket_value :decimal(5, 2)    default(0.0)
#

require 'test_helper'

class PartyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
