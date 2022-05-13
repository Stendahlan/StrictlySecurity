class User < ApplicationRecord
  has_secure_password

  before_create :set_auth_token

  private
  def set_auth_token
    return if authorization_token.present?
    self.authorization_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
