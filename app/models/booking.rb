class Booking < ApplicationRecord
    has_one :passenger
    has_one :flight
end
