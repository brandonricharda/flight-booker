class BookingsController < ActionController::Base
    def new
        @booking = Booking.new
        @flight = Flight.find_by(id: params[:booking][:flight_id])
        @number_of_passengers = params[:booking][:number_of_passengers].to_i
        @passengers = []
        @number_of_passengers.times do
            @passengers << Passenger.new
        end
    end

    def create
        @booking = Booking.new(booking_params)
        # This line below will need some update
        @passenger = Passenger.new(booking_params)
        respond_to do |format|
            if @booking.save
                format.html { redirect_to @booking, notice: "Booking was successfully created." }
            else
                format.html { render :new }
                format.json { render json: @booking.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:flight_id, :number_of_passengers, passengers_attributes: [:name, :email])
    end
end