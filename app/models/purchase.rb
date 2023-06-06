class Purchase < ApplicationRecord
  belongs_to :user
  enum status: { pending: 'pending', succeeded: 'succeeded', canceled: 'canceled' }
  enum provider: { manual: 'manual', yookassa: 'yookassa' }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :title, :description, :currency, presence: true
end
