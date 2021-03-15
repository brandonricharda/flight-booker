class CreateFlightSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_schedules do |t|
      t.references :from_airport, foreign_key: true
      t.references :to_airport, foreign_key: true
      t.timestamps
    end
  end
end
