class PassengersController < ActionController::Base
    def new
        @booking = Booking.find(params[:booking_id])
        @passenger = @booking.passengers.build
    end

    def create
        @booking = Booking.find(params[:booking_id])
        @passenger = @booking.passengers.create(booking_params)
    end
end