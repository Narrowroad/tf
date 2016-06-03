require 'open-uri'
require 'json'
require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
 t = Restaurant.new
 t.name = row['name']
 t.cost = row['cost']
 t.address = row['address']
 t.city = row['city']
 t.st = row['st']
 t.zip = row['zip']
 # full_address = t.address + " " + t.zip.to_s
 # url_safe_street_address = URI.encode(full_address)
 # url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
 # parsed_data = JSON.parse(open(url).read)
 # t.lat= parsed_data["results"][0]["geometry"]["location"]["lat"].to_s
 # t.lng = parsed_data["results"][0]["geometry"]["location"]["lng"].to_s
 t.save
end
