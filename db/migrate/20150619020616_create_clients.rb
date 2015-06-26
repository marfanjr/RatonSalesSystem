class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :profile, index: true

      t.timestamps null: false
    end
  end
end
