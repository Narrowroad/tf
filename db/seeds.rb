require 'open-uri'
require 'json'
require 'csv'


csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
 t = Restaurant.new
 t.name = row['name']
 t.cost = row['cost']
 t.address = row['address']
 t.cuisine = row['cuisine']
 t.city = row['city']
 t.st = row['st']
 t.zip = row['zip']
 t.save
end
