class PassengerMailer < ApplicationMailer
    default from: "brandonricharda@gmail.com"

    def welcome_email
        @passengers = Passenger.where(booking_id: params[:booking][:id])
        @emails = @passengers.map { |passenger| passenger.email }
        @flight = Flight.find_by(id: params[:booking][:flight_id])
        @from_airport = Airport.find_by(id: @flight.from_airport).code 
        @to_airport = Airport.find_by(id: @flight.to_airport).code 
        @date = @flight.departure
        mail(:to => @emails, :subject => "Booking Confirmation")
    end
end