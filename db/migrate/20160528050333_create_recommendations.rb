class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :rating_rec

      t.timestamps

    end
  end
end
