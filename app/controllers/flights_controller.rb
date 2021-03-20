class FlightsController < ActionController::Base
    def index
        @flights = Flight.all
    end

    def new
        @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    end
end