class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.references :product, index: true
      t.references :party, index: true
      t.integer :amount_purchased
      t.decimal :unit_cost, precision: 5, scale: 2
      t.decimal :total_cost, precision: 5, scale: 2
      t.decimal :profit_margin, precision: 5, scale: 2
      t.decimal :amount_sold, precision: 5, scale: 2, default: 0.0

      t.timestamps null: false
    end
  end
end
