class Image < ApplicationRecord
  belongs_to :item, optional: true

  mount_uploaders :image_url, ImageUploader

  validates :image_url, presence: true
end
