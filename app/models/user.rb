class User < ApplicationRecord
  has_many :purchases
  has_many :messages, as: :messagable, dependent: :destroy


  def create_token
    self.reset_password_token = SecureRandom.urlsafe_base64
  end

  def reset_password_sent_at
    self.reset_password_sent_at = Time.current
  end
end
