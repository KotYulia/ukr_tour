class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :country
      t.string :avatar
      t.integer :role

      t.timestamps
    end
  end
end
