class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postal_code, :prefectures, :ctiy, :block_number,presence: true
  # validates :postal_code,format: {with: /\A\d{3}[_]\d{4}\z/}
end
