require_relative "../../config/environment.rb"

class TakeFlight

    attr_accessor :customer, :ticket, :flight

    def initialize
        @customer = nil
        @ticket = nil
        @flight = nil
        @destination = nil
    end



 

    def greetings
        t = Time.now
        if t.strftime('%P') == 'pm'
            puts "\n==== Welcome to CheapAirlines.com ====\n"
        else
            puts "\n==== Welcome to CheapAirlines.com ====\n"
        end
        sleep 2
    end

    def waiting
        print "\nConnecting you with next available agent" 
        sleep 1
        print "."
        sleep 0.75
        print "."
        sleep 0.75
        print "."
        #sleep 0.75
        print "."
        sleep 0.75
        print ".\n"
    end



    def add_customer
        
        t = Time.now
        if t.strftime('%P') == 'pm'
            puts "\nBooking Agent: Good afternoon! Thanks for waiting.\n"
        else
            puts "\nBooking Agent: Good morning! Thanks for waiting.\n"
        end
        sleep 2.5
        puts "Booking Agent: What's your name?\n\n"
        customer_name = gets.chomp
        if Customer.find_by(customer_name: customer_name).nil?
            @customer = Customer.create(customer_name: customer_name)
        else 
            @customer = Customer.find_by(customer_name: customer_name)
        end
            sleep 2
            puts "\nBooking Agent: I wish my name was #{@customer.customer_name}.."
    end


    def domestic_international
        sleep 3
        puts "Booking Agent: So #{@customer.customer_name}, will you be flying International or Domestic?\n\n"
        domestic_int_input = gets.chomp
        # binding.pry
        @customer.domestic_int = domestic_int_input.downcase
        sleep 2
    end


    def dest
        if @customer.domestic_int == "domestic" or @customer.domestic_int == "international"
            puts "\nBooking Agent: Great Choice.\n"
            sleep 2
            puts "Booking Agent: Here is a list of trending #{@customer.domestic_int} flights:\n\n" 
            sleep 1
            flights = Flight.where(domestic_int: @customer.domestic_int)
            # binding.pry
            flights.each.with_index(1) do |flight, index|
            puts "#{index}. #{flight.destination}"
        end
            puts "\nPlease type number for your destination:\n\n"
            flight_input = gets.chomp.to_i - 1 
            flight = flights[flight_input] #find_by
            @ticket = Ticket.create(customer_id: @customer.id, flight_id: flight.id, price: 300, time: Time.now) #creating new instance of a ticket. my joiner. populating the ticket instance variable.
            puts "\nBooking Agent: #{@ticket.flight.destination}? Cool, I've never been."
        # elsif
        #     @customer.domestic_int == "international"
        #     puts "\nBooking Agent: Great Choice.\n"
        #     sleep 2
        #     puts "Booking Agent: Here is a list of trending international flights:\n\n" 
        #     sleep 1
        #     flights = Flight.where(domestic_int: "international")
        #     flights.each.with_index(1) do |flight, index|
        #     puts "#{index}. #{flight.destination}"
        #     end
        #     puts "\nPlease type number for your destination:\n\n"
        #     flight_input = gets.chomp.to_i - 1 
        #     flight = flights[flight_input] #find_by
        #     @ticket = Ticket.create(customer_id: @customer.id, flight_id: flight.id, price: 800, time: Time.now) #creating new instance of a ticket. my joiner. populating the ticket instance variable.
        #     puts "\nBooking Agent: #{@ticket.flight.destination}? Cool, I've never been."
        else
            puts "\nBooking Agent: Let's try that again."
            sleep 2
            domestic_international
        end
    end

    

    
    # def dest_2
    #     if @customer.domestic_int == "domestic"
    #         puts "\nBy the way,#{@customer.customer_name}\n"
    #         sleep 2
    #         puts "Booking Agent: Here is a list of trending domestic flights:\n\n" 
    #         sleep 1
    #         flights = Flight.where(domestic_int: "domestic") #.order("id ASC")
    #         # binding.pry
    #         flights.each.with_index(1) do |flight, index|
    #             puts "#{index}. #{flight.destination}"
    #         end
    #         puts "\n^ Please type number for your destination\n\n"
    #         flight_input = gets.chomp.to_i - 1 
    #         flight = flights[flight_input] #find_by
    #         @ticket = Ticket.create(customer_id: @customer.id, flight_id: flight.id) #creating new ticket
    #     elsif
    #         @customer.domestic_int == "international"
    #         puts "\nBooking Agent: Great Choice.\n"
    #         sleep 2
    #         puts "Booking Agent: Here is a list of trending international flights:\n\n" 
    #         sleep 1
    #         flights = Flight.where(domestic_int: "international")
    #         flights.each.with_index(1) do |flight, index|
    #             puts "#{index}. #{flight.destination}"
    #         end
    #         puts "Please select by typing in the appropriaJote number:\n\n"
    #         flight_input = gets.chomp.to_i - 1 
    #         flight = flights[flight_input] #find_by
    #         @ticket = Ticket.create(customer_id: @customer.id, flight_id: flight.id)

    #         puts "\n\nPlease select by typing in the appropriate number:\n\n"
    #         customer_flight = gets.chomp

    #     else
    #         puts "Booking Agent: Let's try that again."
    #         domestic_international
    #     end
    # end


    def seating
        sleep 2
        puts "Booking Agent: Let's find you a seat #{@customer.customer_name}!\n\n"
        puts "1. First Class"
        puts "2. Economy"
        puts "\nPlease type number to select seat:\n\n"
        seating_input = gets.chomp.to_i
        @ticket.seating = seating_input
    end




    # def seat_confirm 
        sleep 1
    # end

    def goodbye
        # binding.pry
        if @ticket.seating == 1
            @ticket.time = Time.now
            puts "\nBooking Agent: Enjoy #{@ticket.flight.destination}. Your ticket will be $#{@ticket.price}, plus a $55 booking fee."
            puts "Booking Agent: For a grand total of $355. You will be flying first class."
            puts "Booking Agent: Ticket purchase complete at #{@ticket.time}"
        elsif @ticket.seating == 2
            puts "\nBooking Agent: Enjoy #{@ticket.flight.destination}. Your ticket will be $#{@ticket.price}, plus a $30 booking fee."
            puts "Booking Agent: For a grand total of $830. You will be flying economy."
            puts "Booking Agent: Ticket purchase complete at #{@ticket.time}"
          else
            puts "\nBooking Agent: Let's try that again."
        sleep 2
            seating
        end

        sleep 2
    end







end