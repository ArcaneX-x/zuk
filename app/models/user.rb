class User < ApplicationRecord
  has_many :purchases
  has_many :messages, as: :messagable, dependent: :destroy
end
