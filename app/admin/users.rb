ActiveAdmin.register User do


 form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :second_name
      f.input :email
    end
    f.inputs "Admin Level" do
      f.input :role, include_hidden: false, include_blank: false
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :email
    column :name
    column :created_at
    column :role
    actions
  end

  permit_params :id, :email, :name, :role, :school_id
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
