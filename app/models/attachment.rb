class Attachment < ApplicationRecord
  has_one_attached :main_image, dependent: :destroy
end
