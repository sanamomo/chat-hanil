class Sex < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Woman' },
    { id: 3, name: 'Men' }
]
  include ActiveHash::Associations
  has_many :users
end