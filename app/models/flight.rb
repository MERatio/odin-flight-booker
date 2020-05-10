class Flight < ApplicationRecord
  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival,   class_name: 'Airport'

  validates :departure_id,    presence: true
  validates :arrival_id,      presence: true
  validates :departure_date,  presence: true
  validates :duration,        presence: true


  def self.departure_dates
    Flight.find_by_sql("SELECT DISTINCT departure_date
                        FROM flights
                        WHERE departure_date >= datetime('now')
                        ORDER BY departure_date")
  end

  def self.upcoming
    Flight.where('departure_date > ?', DateTime.current)
  end

  def self.search(departure_id, arrival_id ,departure_date)
    Flight.where('departure_id = ? AND arrival_id = ? AND departure_date > ? ',
                  departure_id, arrival_id, departure_date)
  end
end
