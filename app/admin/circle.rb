ActiveAdmin.register Circle do

  index do
    selectable_column
    column :id
    column :name
    column :created_at
    actions
  end

  permit_params :id, :name, :created_at
end
