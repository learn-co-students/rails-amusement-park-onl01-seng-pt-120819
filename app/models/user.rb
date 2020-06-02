class User < ApplicationRecord
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  #validates :nausea, presence: true
  #validates :happiness, presence: true

  def mood 

    if self.nausea && self.happiness
      happiness > nausea ? "happy" : "sad"
    else
      "N/A"
    end
  end
end
