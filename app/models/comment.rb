class Comment < ApplicationRecord
  belongs_to :sound
  belongs_to :user

  validates :text, presence: true
end
