class Booking < ApplicationRecord
    has_many :passengers
    has_one :flight
    accepts_nested_attributes_for :passengers
end