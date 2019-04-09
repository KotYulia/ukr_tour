ActiveAdmin.register Place do
  form do |f|
    f.inputs do
      f.input :title
      f.input :image
      f.input :description, as: :froala_editor
    end

    f.actions
  end

  permit_params :title, :image, :description


  index do
    column :id
    column :title
    column :created_at
    column :updated_at

    actions
  end


end
