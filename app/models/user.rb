class User < ApplicationRecord
  include UserBehaviour

  has_many :purchases
  has_many :messages, as: :messagable, dependent: :destroy
end
