class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sounds, dependent: :destroy
  has_many :comments
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_sounds,  through: :likes, source: :sound

  def already_liked?(sound)
    likes.exists?(sound_id: sound.id)
  end

  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :nickname, uniqueness: true
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,100}+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
    validates :image
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64(10)
      user.nickname = 'ゲストさん'
      # user.image = fixture_file_upload('public/testimages/test_image02.jpg')
    end
  end
end
