class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :description
      t.date :date
      t.time :time
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
