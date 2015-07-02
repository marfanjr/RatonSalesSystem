class AddProductNameToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :product_name, :string
  end
end
