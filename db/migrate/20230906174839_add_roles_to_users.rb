class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :customer_support, :boolean
  end
end
