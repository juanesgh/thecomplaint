class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one_attached :avatar
    has_many :messages
    has_many :posts
    has_many :comments, through: :posts
    validates :name, presence: true
    validates :lastname, presence: true
    validates :nick, presence: true
    validates :phone, presence: true, numericality: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :country, presence: true
    validates :city, presence: true
end
