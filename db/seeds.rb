# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airport_codes = ["SFO", "NYC"]

airport_codes.each { |city| Airport.create(code: city) }

dates = []

1.upto(12) { |hour| dates << DateTime.new(2021, 1, 1, hour, 0) }

airports = Airport.all.to_a

airports.each do |source|
    airports.each do |destination|
        next if source == destination
        dates.each_slice(2) do |takeoff, landing|
            Flight.create(from_airport_id: source.id, to_airport_id: destination.id, departure: takeoff, duration: landing.hour - takeoff.hour)
        end
    end
end