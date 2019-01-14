class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :birthday, :date
    add_column :users, :class, :string
    add_column :users, :form, :integer
    add_column :users, :phone, :string
    add_column :users, :role, :string
    add_column :users, :snapchat_user, :string
    add_column :users, :insta_user, :string
    add_column :users, :tiktok_user, :string
  end
end
