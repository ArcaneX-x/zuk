class EducationMaterial < ApplicationRecord
  has_many :prices
  has_many :equipments
  belongs_to :catalogue

  validates :title, presence: true
end
