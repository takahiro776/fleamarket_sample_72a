class AddColumnToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :ship_family_name, :string, null: false
    add_column :addresses, :ship_first_name, :string, null: false
    add_column :addresses, :ship_family_name_kana, :string, null: false
    add_column :addresses, :ship_first_name_kana, :string, null: false
    add_column :addresses, :telephone, :string
  end
end
