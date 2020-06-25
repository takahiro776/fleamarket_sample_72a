class Image < ApplicationRecord
  belongs_to :item, optional: true

  validates :image_url, presence: true
end
