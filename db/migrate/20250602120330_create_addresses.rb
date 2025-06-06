class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :shipped_from_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :telephone_number, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
