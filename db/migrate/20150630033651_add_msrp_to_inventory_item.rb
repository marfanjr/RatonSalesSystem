class AddMsrpToInventoryItem < ActiveRecord::Migration
  def change
    add_column :inventory_items, :msrp, :decimal, precision: 5, scale: 2
  end
end
