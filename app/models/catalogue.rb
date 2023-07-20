class Catalogue < ApplicationRecord
  has_many :education_materials
  has_one_attached :image, dependent: :destroy do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 400]
  end
  validates :title, :description, presence: true
  validates :image, attached: true, content_type: [:jpg, :jpeg]
end
