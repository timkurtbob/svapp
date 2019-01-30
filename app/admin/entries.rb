ActiveAdmin.register Entry do


 # form do |f|
 #    f.inputs "Identity" do
 #      f.input :first_name
 #      f.input :second_name
 #      f.input :email
 #    end
 #    f.inputs "Admin Level" do
 #      f.input :role, include_hidden: false, include_blank: false
 #    end
 #    f.actions
 #  end

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
# See permitted parameters documentation:
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
