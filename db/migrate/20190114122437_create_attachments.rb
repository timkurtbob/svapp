class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :name
      t.references :entry, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
