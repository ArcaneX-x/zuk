class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  validates :body, presence: true

  # TODO add source_message_id ID type column

  def source_message?
    source_message_id.blank?
  end

  def child_message?
    !source_message?
  end
end
