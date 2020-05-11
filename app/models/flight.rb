class Flight < ApplicationRecord
  belongs_to  :departure, class_name: 'Airport'
  belongs_to  :arrival,   class_name: 'Airport'
  has_many    :bookings

  validates :departure_id,    presence: true
  validates :arrival_id,      presence: true
  validates :departure_date,  presence: true
  validates :duration,        presence: true

  def self.departure_dates
    Flight.select(:departure_date).distinct
          .where(['departure_date >= ?', DateTime.current])
          .order(:departure_date)
  end

  def self.upcoming
    Flight.where('departure_date > ?', DateTime.current)
  end

  def self.search(departure_id, arrival_id ,departure_date)
    Flight.where('departure_id = ? AND arrival_id = ? AND departure_date > ? ',
                  departure_id, arrival_id, departure_date)
  end
end
