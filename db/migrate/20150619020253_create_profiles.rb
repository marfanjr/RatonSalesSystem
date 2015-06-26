class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :telephone
      t.string :cell_phone
      t.string :email
      t.decimal :credits, precision: 5, scale: 2, default: 0

      t.timestamps null: false
    end
  end
end
