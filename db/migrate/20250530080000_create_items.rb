class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :shipped_from_id, null: false
      t.integer :delivery_time_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
