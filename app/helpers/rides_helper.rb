module RidesHelper

    def take_ride(user, attraction)
        if (user.height < attraction.min_height) && (user.tickets < attraction.tickets) 
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif user.tickets < attraction.tickets
            return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
            user.tickets.update
        elsif user.height < attraction.min_height
            return "Sorry. You are not tall enough to ride the #{attraction.name}."
            
        end
        user.update(happiness: user.happiness + attraction.happiness_rating, nausea: user.nausea + attraction.nausea_rating, 
            tickets: user.tickets - attraction.tickets)
        return "Thanks for riding the #{attraction.name}!"
    end
end
