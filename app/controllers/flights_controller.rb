class FlightsController < ActionController::Base
    def index
        @flights = Flight.all
        @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
        @flight_dates = Flight.pluck(:departure).uniq
    end
end