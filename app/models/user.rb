class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Password Include both letters and numbers' }
  validates :nickname, :email, :birthday, presence: true
  validates :email, uniqueness: true

  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            presence: true, presence: { message: 'can’t be black' }

  validates :first_name, :last_name,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :first_name_kana, :last_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }

 has_many :products
end


