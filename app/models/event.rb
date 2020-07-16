class Event < ApplicationRecord
  has_one :user, through: :venue
  has_many :ratings, dependent: :destroy
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

  def average_crowded_level
    if self.ratings.count == 0
      return 0
    else
      sum_crowding = 0
      self.ratings.each do |rating|
        sum_crowding += rating.crowd_level
      end
      return sum_crowding / self.ratings.count
    end
  end

  def waiting_time_now
    if self.ratings.count == 0
      return 0
    else
      waiting_time_now = ""
      waiting_time_now = self.ratings.last.waiting_time
    end

    return waiting_time_now
  end

  def waiting_time_to_integer
    if waiting_time_now == 0
      return 0
    else
      waiting_time_now.split[0].to_i
    end
  end
end
