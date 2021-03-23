class AddFlightAndPassengersToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :flight, foreign_key: true
    add_column :bookings, :passengers, :integer
  end
end