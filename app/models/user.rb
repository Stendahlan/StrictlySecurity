class User < ApplicationRecord
  has_secure_password

  def set_auth_token
    self.authorization_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid
  end
end
