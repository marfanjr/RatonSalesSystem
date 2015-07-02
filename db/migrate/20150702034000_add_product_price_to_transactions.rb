class AddProductPriceToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :product_price, :decimal, precision: 5, scale: 2
  end
end
