class Booking < ApplicationRecord
  belongs_to :flight
  has_many   :passengers, inverse_of: :booking
  accepts_nested_attributes_for :passengers, 
    reject_if: lambda { |attributes| attributes[:name].blank? || attributes[:email].blank? }

  validates :flight_id, presence: true
  validates :num_of_tickets, numericality: { only_integer: true, greater: 0, 
                                             less_than: 5 }
end
