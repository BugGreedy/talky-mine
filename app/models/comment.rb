class Comment < ApplicationRecord
  belongs_to :sound
  belongs_to :user
end
