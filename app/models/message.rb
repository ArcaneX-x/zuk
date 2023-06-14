class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  validates :body, presence: true

  # TODO add source_message_id column type as ID type
end
