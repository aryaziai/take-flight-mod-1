require_relative '../config/environment.rb'
require_relative '../app/models/cli.rb'

arya = TakeFlight.new

user_input = nil
until user_input == "quit"
    arya.greetings
    arya.waiting
    arya.add_customer
    arya.domestic_international
    arya.dest
    arya.seating
    arya.goodbye
    puts "\nBooking Agent: Would you like to purchase another ticket? 'Yes' or 'No'\n\n"
    user_input = gets.chomp
    if user_input == 'no' or user_input == "No" or user_input == "exit" or user_input == "Exit" or user_input == "quit" or user_input == "Quit"
        break
    end
end

#binding.pry


