class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if (self.user.height < self.attraction.min_height) && (self.user.tickets < self.attraction.tickets) 
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
            self.user.tickets.update
        elsif self.user.height < self.attraction.min_height
            return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        end
        self.user.update(happiness: self.user.happiness + 4, nausea: self.user.nausea + 2, tickets: self.user.tickets - 5)
    end
end

