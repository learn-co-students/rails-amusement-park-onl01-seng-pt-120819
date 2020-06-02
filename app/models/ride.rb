class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
    # binding.pry
       

        attraction = Attraction.find_by(id: self.attraction_id)
        user = User.find_by(id: self.user_id)

        check_result = height_check(user: user, attraction: attraction)
        check_tickets = tickets_check(user: user, attraction: attraction)
        if check_result.empty? && check_tickets.empty?
            
            user.update(tickets: user.tickets -= attraction.tickets)
            user.update(nausea: user.nausea += attraction.nausea_rating)
            user.update(happiness: user.happiness += attraction.happiness_rating)

            return "Thanks for riding the #{attraction.name}!"
        else 
            return "Sorry." + check_tickets + check_result
        end
    end

    def height_check(user: user, attraction: attraction)
        if user.height < attraction.min_height
            return " You are not tall enough to ride the #{attraction.name}."
        else
            return "" 
        end

    end

    def tickets_check(user: user, attraction: attraction)
        if user.tickets < attraction.tickets
            return " You do not have enough tickets to ride the #{attraction.name}."
        else
            return "" 
        end
    end

end
