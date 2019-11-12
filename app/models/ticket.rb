class Ticket < ActiveRecord::Base #join table

    belongs_to :customer
    belongs_to :flight
    
    # def price
    #     # if flight = domestic
    # end









end