require_relative '/Users/aryaziai/Development/Final_Project/config/environment.rb'
require 'sinatra/activerecord/rake'

# The seeds file is a quick way to populate the database

desc 'starts a console'
task :console do
  # ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end


# flight_number = Faker::IDNumber.spanish_citizen_number
# airline_name = Faker::Company.name
# domestic_int = "Domestic"
# destination = Faker::Team.state #domestic
# my_flight = Flight.create(flight_number: Faker::IDNumber.spanish_citizen_number, airline: "#{Faker::Company.name} Airlines", destination: destination)


  # This is for domestic flights.
  5.times do 
  Flight.create(
    flight_number: Faker::IDNumber.spanish_citizen_number, 
    airline: "#{Faker::Company.name} Airlines", 
    destination: Faker::Team.state, 
    domestic_int: "domestic"
  )
  end

  #This is for international flights.
  5.times do 
  Flight.create(
    flight_number: Faker::IDNumber.spanish_citizen_number, 
    airline: "#{Faker::Company.name} Airlines", 
    destination: Faker::WorldCup.city, 
    domestic_int: "international"
  )
end


  5.times do 
  Ticket.create(
    customer_id: Faker::Number.number(digits: 3),
    flight_id: Faker::IDNumber.spanish_citizen_number,
    seating: "First Class",
    price: Faker::Number.number(digits: 3),
    time: Time.now
  )
end





# customer_name = Faker::Name.name  
# customer_id = Faker::IDNumber.invalid_south_african_id_number
# flight_id = Faker::IDNumber.spanish_citizen_number
# price = Faker::Number.number(digits: 3)
# time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)
# my_ticket = Ticket.create(customer_name: customer_name, customer_id: customer_id, flight_id: flight_id, price: price, time: time)

# age = @age
# AddGenderToCustomers
# NameError


#CREATE A NEW TICKET. AND RUN   
#TICKET CUSTOMER ID = FAKER.......
#TICKET FLIGHT NUMBER = FAKER......







# sfo = Flight.new("sfo")
# sfo.desintation

# Flight.find_or_create_by(name: "Domestic")
# Flight.find_or_create_by(name: "International")

# 8.times do
# 	Doctor.find_or_create_by(
# 		name: Faker::Name.name, 
# 		department_id:  Faker::Number.between(from: 1, to: 3)
# 	)
# end

# 8.times do
# 	Patient.find_or_create_by(
# 		name: Faker::Name.name, 
# 		age: Faker::Number.between(from: 1, to: 100)
# 	) 
# end

# 15.times do
# 	Appointment.find_or_create_by(
# 		doctor_id: Faker::Number.between(from: 1, to: 8), 
# 		patient_id: Faker::Number.between(from: 1, to: 8), 
# 		time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
# 	)
# end
 