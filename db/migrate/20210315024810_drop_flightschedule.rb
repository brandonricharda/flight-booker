class DropFlightschedule < ActiveRecord::Migration[5.2]
  def change
    drop_table :flight_schedules
  end
end
