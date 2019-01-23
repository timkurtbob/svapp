class RenameAdminLevelToRoleInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :admin_level, :role
  end
end
