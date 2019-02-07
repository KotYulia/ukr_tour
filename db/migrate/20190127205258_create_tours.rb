class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :image
      t.string :price
      t.string :category
      t.text :description
      t.text :program
      t.string :city
      t.string :date
      t.string :duration

      t.timestamps
    end
  end
end
