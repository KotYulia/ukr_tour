ActiveAdmin.register Tour do
  form do |f|
    f.inputs do
      f.input :title
      f.input :image
      f.input :price
      f.input :category
      f.input :description, as: :froala_editor
      f.input :program, as: :froala_editor
      f.input :city
      f.input :date
      f.input :duration
    end

    f.actions
  end

  permit_params :title, :image, :price, :category, :description, :program, :city, :date, :duration

end
