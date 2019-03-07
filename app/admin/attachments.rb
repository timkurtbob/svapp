ActiveAdmin.register Attachment do

  index do
    selectable_column
    column :user
    column :id
    column :file_name
    column :file_type
    column :created_at
    actions
  end

  permit_params :user, :id, :file_name, :file_type, :created_at
end
