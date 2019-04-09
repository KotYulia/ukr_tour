class AddReferencesToTours < ActiveRecord::Migration[5.2]
  def change
    add_reference :tours, :user
  end
end
