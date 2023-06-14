class Price < ApplicationRecord
  belongs_to :education_material
  validates :title, :amount, presence: true
  # TODO add price type (think out fancy name) column String type
end
