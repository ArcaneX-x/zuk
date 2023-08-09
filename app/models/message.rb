class Message < ApplicationRecord
  belongs_to :messagable, polymorphic: true
  validates :body, presence: true

  belongs_to :source_message, class_name: 'Message', foreign_key: :source_id, optional: true
  has_many :messages, class_name: 'Message', foreign_key: :source_id

  def source_message?
    source_id.blank?
  end

  def child_message?
    !source_message?
  end
end
