# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  cpf        :string(255)
#  rg         :string(255)
#  telephone  :string(255)
#  cell_phone :string(255)
#  email      :string(255)
#  credits    :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
