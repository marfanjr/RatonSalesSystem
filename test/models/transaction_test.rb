# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  customer_id :integer
#  party_id    :integer
#  quantity    :decimal(5, 2)
#  value       :decimal(5, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
