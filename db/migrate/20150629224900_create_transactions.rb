class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :employee, index: true
      t.references :customer, index: true
      t.references :party, index: true
      t.decimal :quantity, precision: 5, scale: 2
      t.decimal :value, precision: 5, scale: 2

      t.timestamps null: false
    end
  end
end
