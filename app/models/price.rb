class Price < ApplicationRecord
  belongs_to :education_material
  validates :title, :amount, presence: true
end
