class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :brand
      t.string :condition, null: false
      t.string :delivery_fee, null: false
      t.string :delivery_regions, null: false
      t.string :shipping_schedule, null: false
      t.integer :price, null: false
      t.references :user
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
