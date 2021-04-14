class PassengerMailer < ApplicationMailer
    default from: "brandonricharda@gmail.com"

    def welcome_email
        @passenger = params[:passenger]
        @booking = @passenger[:booking_id]
        @flight = Flight.find_by(id: @booking.flight_id)
        mail(to: @passenger.email, subject: "Booking Confirmation")
    end
end
