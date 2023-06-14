class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :education_material

  enum status: { pending: 'pending', succeeded: 'succeeded', canceled: 'canceled' }
  enum provider: { manual: 'manual', yookassa: 'yookassa' }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :title, :description, :currency, presence: true
  # TODO rename title to description
end
