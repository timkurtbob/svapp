class ChangeAdminLevlToAdminLevelInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :admin_levl, :admin_level
  end
end
