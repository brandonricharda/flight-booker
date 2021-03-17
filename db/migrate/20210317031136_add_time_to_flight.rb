class AddTimeToFlight < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :departure, :datetime 
    add_column :flights, :duration, :integer
  end
end