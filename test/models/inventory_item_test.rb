# == Schema Information
#
# Table name: inventory_items
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  party_id         :integer
#  amount_purchased :integer
#  unit_cost        :decimal(5, 2)
#  total_cost       :decimal(5, 2)
#  profit_margin    :decimal(5, 2)
#  amount_sold      :decimal(5, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class InventoryItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
