class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :restaurant_id, presence:true, :uniqueness => {:scope => :user_id}
  validates :rating, presence:true
  validates :user_id, presence:true

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 5 }

end
