class BookingsController < ActionController::Base
    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            redirect_to @booking
        else
            redirect_to root
        end
    end

    private

    def booking_params
        params.require(:booking).permit(booking: [:flight_id, :passengers])
    end
end