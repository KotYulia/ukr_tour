ActiveAdmin.register User do
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :city
      f.input :country, as: :string
      f.input :avatar
      f.select(:role, User.roles.keys.map {|role| [role.titleize,role]})
    end

    f.actions
  end

  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :city, :country, :avatar, :role

  index do
    column :id
    column :email
    column :first_name
    column :last_name
    column :role
    column :created_at
    column :updated_at

    actions
  end

  config.comments = false
end
