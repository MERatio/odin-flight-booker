class AddIndexToPassengersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :passengers, :email, unique: true 
  end
end
