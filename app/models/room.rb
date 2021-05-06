class Room < ApplicationRecord
  
  validates :name, presence: true

  has_many :room_users #, foreign_key: 'room_id'
  has_many :users, through: :room_users
end
