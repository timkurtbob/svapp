ActiveAdmin.register Entry do

  index do
    selectable_column
    column :user
    column :id
    column :title
    column :description
    column :created_at
    actions
  end

  permit_params :id, :title, :description, :created_at
end
