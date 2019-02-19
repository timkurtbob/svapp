ActiveAdmin.register Comment, :as => "User Comments" do

  index do
    selectable_column
    column :id
    column :text
    actions
  end

  permit_params :id, :text, :created_at
end
