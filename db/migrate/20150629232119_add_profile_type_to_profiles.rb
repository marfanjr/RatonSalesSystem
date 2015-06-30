class AddProfileTypeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :profile_type, :integer
  end
end
