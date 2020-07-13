class Chatroom < ApplicationRecord
  belongs_to :venue
  has_many :messages
  has_many :users, through: :ratings
  has_many :users, through: :messages
end
