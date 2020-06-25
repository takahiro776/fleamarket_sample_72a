class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false, limit: 7
      t.string     :prefectures,   null: false
      t.string     :ctiy,          null: false
      t.string     :block_number,  null: false
      t.string     :apartment_name
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
