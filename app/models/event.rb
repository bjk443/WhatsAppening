class Event < ApplicationRecord
    has_many :ratings
    belongs_to :venue
    def average_rating
        if self.ratings.count == 0
            return 0
        else
            sum_rating = 0
            self.ratings.each do |rating|
            sum_rating += rating.stars
            end
        return sum_rating / self.ratings.count
        end
    end
end

