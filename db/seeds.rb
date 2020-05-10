# airports
Airport.create!(code: 'AAL')
Airport.create!(code: 'AAR')
Airport.create!(code: 'ABA')
Airport.create!(code: 'ABC')
Airport.create!(code: 'ABE')
Airport.create!(code: 'ABI')

# flights
500.times do
  airports = Airport.order('RANDOM()')
  flight = Flight.new
  flight.departure = airports[0]
  flight.arrival = airports[1]
  flight.departure_date = Faker::Time.between(from: 2.days.ago, to: 14.days.from_now)
  flight.duration = rand(1.0..8.0)
  flight.save!
end   