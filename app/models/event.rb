class Event < ApplicationRecord
    def total_rating
        # calculate rating for event = sum of all ratings/no. of ratings
        sum_rating = 0
        self.ratings.each do |rating|
          sum_rating += rating.stars
        end
        return sum_rating / self.ratings.count
    end
end


