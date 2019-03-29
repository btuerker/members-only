class User < ApplicationRecord
  before_create :create_remember_token

  has_many :posts
  has_secure_password

  private

  def create_remember_token
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
  end
end
