class AddPendingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending, :boolean, null: false, default: true
  end
end
