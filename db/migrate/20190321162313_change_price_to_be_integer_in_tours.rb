class ChangePriceToBeIntegerInTours < ActiveRecord::Migration[5.2]
  def up
    change_column :tours, :price, :integer
  end

  def down
    change_column :tours, :price, :integer, using: 'price::integer'
  end
end
