class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :pic
      t.references :entry, foreign_key: true

      t.timestamps
    end
  end
end
