class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Korea' },
    { id: 3, name: 'Japan' }

]
  include ActiveHash::Associations
  has_many :users
end