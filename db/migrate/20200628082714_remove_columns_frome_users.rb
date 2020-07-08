class RemoveColumnsFromeUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password, :string
    remove_column :users, :password_conform, :string
  end
end
