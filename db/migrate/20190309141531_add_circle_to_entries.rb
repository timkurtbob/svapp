class AddCircleToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :circle, foreign_key: true
  end
end
