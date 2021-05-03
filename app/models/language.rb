class Language < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Korean' },
    { id: 3, name: 'Japanese' }
]
  include ActiveHash::Associations
  has_many :users
end