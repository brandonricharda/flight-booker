class PassengerMailer < ApplicationMailer
    default from: "brandonricharda@gmail.com"

    def welcome_email
        @passenger = Passenger.find_by(booking_id: params[:booking][:id])
        mail(:to => @passenger.email, :subject => "Booking Confirmation")
    end
end