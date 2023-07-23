module UserBehaviour
  extend ActiveSupport::Concern

  included do
    attr_accessor :password

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }

    after_validation :encrypt_password, if: -> { password.present? }

    private

    def encrypt_password
      data = Illustrations::WordMetamorphosis.new.call(password)

      self.encrypted_password = data[:encrypted_password]
      self.salt = data[:salt]
    end
  end
end
