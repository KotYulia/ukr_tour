class ChangePriceToBeIntegerInTours < ActiveRecord::Migration[5.2]
  def change
    change_column :tours, :price, :integer
  end
end
