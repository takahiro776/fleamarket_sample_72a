class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :address
  has_one :creditcard
  has_many :deals
  has_many :likes
  has_many :messages
  has_many :comments
  has_one :destination

  validates :nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_year, :birth_month, :birth_day, presence: true
  validates :email, uniqueness: true
end
