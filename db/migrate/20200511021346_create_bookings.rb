class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :flight
      t.integer :num_of_tickets

      t.timestamps
    end
  end
end
