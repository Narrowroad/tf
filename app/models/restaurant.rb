class Restaurant < ActiveRecord::Base
  require 'open-uri'
  before_create :set_lat_lng

      belongs_to :user
      has_many :ratings
      has_many :recommendations


    validates :name, presence:true, uniqueness:true
    validates :address, presence:true
    validates :zip, presence:true

  def set_lat_lng
    full_address = self.address + " " + self.zip.to_s
    url_safe_street_address = URI.encode(full_address)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
    parsed_data = JSON.parse(open(url).read)
    self.lat= parsed_data["results"][0]["geometry"]["location"]["lat"].to_s
    self.lng = parsed_data["results"][0]["geometry"]["location"]["lng"].to_s
  end


end
