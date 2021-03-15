class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :from_airport
      t.references :to_airport
      t.timestamps
    end
  end
end
