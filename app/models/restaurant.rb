class Restaurant < ActiveRecord::Base
      belongs_to :user
      has_many :ratings
      has_many :recommendations


    validates :name, presence:true, uniqueness:true
    validates :address, presence:true
    validates :zip, presence:true

end
