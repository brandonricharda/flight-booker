# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([{ code: "SFO" }, { code: "NYC" }])

dates = []

1.upto(12) { |hour| dates << DateTime.new(2021, 1, 1, hour, 0) }

airports.each do |airport|
    destination = airports.select { |x| x != airport }
    dates.each_slice(2) do |start, finish|
        Flight.create(from_airport_id: airport.id, to_airport_id: destination.id, departure: start, duration: finish.hour - start.hour)
    end
end