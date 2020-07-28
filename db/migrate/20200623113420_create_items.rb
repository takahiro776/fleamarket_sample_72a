class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :brand
      t.integer :condition, null: false
      t.integer :delivery_fee, null: false
      t.integer :delivery_regions, null: false
      t.integer :shipping_schedule, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
