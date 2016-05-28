class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :address
      t.integer :zip
      t.string :city
      t.string :st
      t.string :cuisine
      t.integer :cost
      t.integer :reservations
      t.integer :wifi

      t.timestamps

    end
  end
end
