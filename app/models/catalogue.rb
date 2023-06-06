class Catalogue < ApplicationRecord
  has_many :education_materials

  validates :title, :description, presence: true
end
