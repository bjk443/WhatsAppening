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

  def messaging_user_avatars
    @messages = self.chatroom.messages
                            .where(user: 'normal_user')
                            .reorder('created_at DESC')
                            .limit(3)
    avatar_photo_set = @messages.map { |m| m.user.profile_photo }
end
