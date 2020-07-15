class Venue < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :events, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [:category],
    using: {
      tsearch: { prefix: true }
    }

  def messaging_user_avatars
    @messages = self.chatroom.messages
                            .reorder('created_at DESC')
                            .limit(3)
    @messages.map { |m| m.user }.uniq.map { |u| u.profile_photo }
  end
  # The above function calls the profile photos of the last 3 unique people who have posted on the chat

  def messaging_user_avatar
    @messages = self.chatroom.messages
    @messages.user.profile_photo
  end
end
