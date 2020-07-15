class Chatroom < ApplicationRecord
  belongs_to :venue
  has_many :messages, dependent: :destroy
  has_many :users, through: :ratings, dependent: :destroy
  has_many :users, through: :messages, dependent: :destroy
end
