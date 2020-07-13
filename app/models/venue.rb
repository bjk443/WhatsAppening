class Venue < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :events
  has_one :chatroom
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [:category],
    using: {
      tsearch: { prefix: true }
    }

  # def messaging_user_avatar
  #   # write a query to get all the messages posted
  #   if self.chatrooms.messages.count == 0
  #     return 0
  #   else
  #     self.chatrooms.messages
  #   end
end
