class Message < ApplicationRecord

  validates :sender_id, presence: true, numericality: true
  validates :receiver_id, presence: true, numericality: true
  validates :message, presence: true
end
