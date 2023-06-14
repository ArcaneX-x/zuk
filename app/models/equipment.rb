class Equipment < ApplicationRecord
  belongs_to :education_material
  validates :title, presence: true
  # TODO add model attachment
end
