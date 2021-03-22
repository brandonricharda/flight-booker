class BookingsController < ActionController::Base
    def new
        @booking = Booking.new
    end
end