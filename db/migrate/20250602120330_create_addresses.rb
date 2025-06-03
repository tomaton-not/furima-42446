class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :post_code
      t.integer :shipped_from_id
      t.string :city
      t.string :house_number
      t.string :building_name
      t.string :telephone_number
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
