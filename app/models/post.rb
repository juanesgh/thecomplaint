class Post < ApplicationRecord
    validates :user_id, presence: true, numericality: true
    validates :title, presence: true
    validates :description, presence: true
    validates :postimages, presence: true
    validates :location, presence: true
    has_many_attached :postimages
    has_many_attached :files
    has_many :comments
    has_many :user_like_posts
    belongs_to :users, optional: true
end