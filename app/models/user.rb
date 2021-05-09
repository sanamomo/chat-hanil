class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image
  belongs_to_active_hash :sex
  belongs_to_active_hash :area
  belongs_to_active_hash :language

  with_options presence: true do
    validates :nickname, format: { with: /\A[a-zA-Z가-힇ㄱ-ㅎㅏ-ㅣぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :last_name, format: { with: /\A[a-zA-Z가-힇ㄱ-ㅎㅏ-ㅣぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name, format: { with: /\A[a-zA-Z가-힇ㄱ-ㅎㅏ-ㅣぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_eng, format: { with: /\A[a-zA-Z]+\z/ }
    validates :first_name_eng, format: { with: /\A[a-zA-Z]+\z/ }
    validates :birthday
  end

  with_options numericality: { other_than: 1 } do
    validates :sex_id
    validates :area_id
    validates :language_id
  end

  has_many :posts
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :likes

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end
