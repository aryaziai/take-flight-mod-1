class CreateCustomers < ActiveRecord::Migration[5.2]

  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :domestic_int
    end  
  end
end
