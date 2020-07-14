class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :venues, dependent: :destroy
  has_one_attached :profile_photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
