class Like < ApplicationRecord
  belongs_to :sound
  belongs_to :user
  validates_uniqueness_of :sound_id, scope: :user_id
end
