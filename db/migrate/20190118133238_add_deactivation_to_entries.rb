class AddDeactivationToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :deactivated, :boolean, default: false
  end
end
