class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.belongs_to :booking
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
