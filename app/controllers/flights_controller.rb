class FlightsController < ActionController::Base
    def index
        @flights = Flight.all
        @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
        @flight_dates = Flight.pluck(:departure).uniq
        @searched_flights = []
        if params[:number_of_passengers]
            @searched_flights = Flight.where(from_airport_id: params[:from_airport_id]).where(to_airport_id: params[:to_airport_id]).where(departure: params[:departure])
        end
    end
end