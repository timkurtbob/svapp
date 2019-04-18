class AddDeactivatedToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :deactivated, :boolean, default: false, null: false
  end
end
