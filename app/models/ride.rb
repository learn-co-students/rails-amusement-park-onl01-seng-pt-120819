class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
      if (self.attraction.tickets > self.user.tickets) && (self.attraction.min_height > self.user.height.to_i)
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.attraction.min_height > self.user.height.to_i
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.attraction.tickets > self.user.tickets
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      elsif self.attraction.min_height > self.user.height.to_i
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      else
        self.user.tickets -= self.attraction.tickets
        self.user.nausea += self.attraction.nausea_rating
        self.user.happiness += self.attraction.happiness_rating.to_i
        self.user.save
         "Thanks for riding the #{self.attraction.name}!"
        end
    end

end
