class Flight < ActiveRecord::Base


has_many :tickets
has_many :customers, through: :tickets

    def passengers 
        # active record provides us with all method
        # this will give us back all our passengers
        #self.class.all
        Passengers.all.select do |passenger| #iterrating through each passenger
            passenger.flight_id == self.id
        #call on any attribute we have in scheme
        # comparing it to flight id so we use self
        # every passenger belongs to a flight. checking if flight id
        # is equal to this particular flight instance.
        end
    end


    



end