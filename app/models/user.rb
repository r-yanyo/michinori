class User < ApplicationRecord
  has_secure_password validations: true
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  #引数に関連するユーザーが存在すればそれを返し、存在しなければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
    #OmniAuthで取得した各データを代入していく
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]
    email = auth_hash[:info][:email]

    User.find_or_create_by(email: email) do |user|
      user.nickname = nickname
      user.image_url = image_url
      user.email = email
    end
  end

end
