class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin_levl, :integer, null: false, default: 3
  end
end
