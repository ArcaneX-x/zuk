class EducationMaterial < ApplicationRecord
  has_many :prices
  has_many :equipments
  belongs_to :catalogue
  has_many :messages, as: :messagable, dependent: :destroy

  validates :title, presence: true
end
