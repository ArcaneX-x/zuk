class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  validates :body, presence: true
end
