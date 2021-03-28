class BookingsController < ActionController::Base
    def new
        @booking = Booking.new
        @flight = Flight.find_by(id: params[:booking][:flight_id])
        @number_of_passengers = params[:booking][:number_of_passengers].to_i
        @number_of_passengers.times { @booking.passengers.build }
    end

    def create
        @booking = Booking.new(booking_params)
        respond_to do |format|
            if @booking.save
                format.html { redirect_to @booking, notice: "Booking was successfully created." }
            else
                format.html { render :new }
                format.json { render json: @booking.errors, status: :unprocessable_entity }
            end
        end
    end

    def index
        @bookings = Booking.all
    end

    def show
        @booking = Booking.find(params[:id])
        @flight = Flight.find_by(id: @booking.flight_id)
        @from_airport_code = Airport.find_by(id: @flight.from_airport_id).code
        @to_airport_code = Airport.find_by(id: @flight.to_airport_id).code
        @takeoff = @flight.departure
        @landing = (@takeoff + @flight.duration.hours)
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, :number_of_passengers, passengers_attributes: [:name, :email])
    end
end