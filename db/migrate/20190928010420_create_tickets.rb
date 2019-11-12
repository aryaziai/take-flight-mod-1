class CreateTickets < ActiveRecord::Migration[5.2]

  def change
     create_table :tickets do |t|
      t.integer :customer_id
      t.integer :flight_id
      t.integer :seating
      t.integer :price
      t.string :time
    end
  end

end
