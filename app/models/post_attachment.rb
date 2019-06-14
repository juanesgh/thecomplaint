class PostAttachment < ApplicationRecord
    validates :file, presence: true
end
