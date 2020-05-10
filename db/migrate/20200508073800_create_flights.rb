class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer  :departure_id
      t.integer  :arrival_id
      t.datetime :departure_date
      t.float    :duration
      
      t.timestamps
    end
  end
end
