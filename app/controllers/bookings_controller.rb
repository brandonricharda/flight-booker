class BookingsController < ActionController::Base
    def new
        @booking = Booking.new
        @flight = Flight.find_by(id: params[:booking][:flight_id])
        @number_of_passengers = params[:booking][:passengers].to_i
        @passengers = []
        @number_of_passengers.times do
            @passengers << Passenger.new
        end
    end

    def create
    end

    private

    def booking_params
        params.require(:booking).permit(booking: [:flight_id, :passengers])
    end
end