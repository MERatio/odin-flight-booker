class Airport < ApplicationRecord
  has_many :departing_flights, foreign_key: 'from_code_id', class_name: 'Flight'
  has_many :arriving_flights,  foreign_key: 'to_code_id',   class_name: 'Flight'

  validates :code, presence: true, length: { is: 3 }
end
