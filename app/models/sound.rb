class Sound < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # carrierwave導入後のuploderをジェネレート時に追記
  mount_uploader :file, AudiofileUploader

  def self.search(search)
    if search != ''
      Sound.where('text LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%")
      # OR Sound.joins(:user).where('nickname LIKE(?)', "%#{search}%")
    else
      Sound.all
    end
  end

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    # validates :file
    validates :genre_id, numericality: { other_than: 0, message: 'は選択しないと出品できません' }
  end
end
