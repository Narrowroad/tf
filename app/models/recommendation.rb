class Recommendation < ActiveRecord::Base


  belongs_to :user
  belongs_to :restaurant

  validates :restaurant_id, presence:true, uniqueness:true
  validates :user_id, presence:true
end
