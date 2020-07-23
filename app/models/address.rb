class Address < ApplicationRecord
  belongs_to :user
  validates :postal_code, :prefectures, :ctiy, :block_number, :ship_family_name, :ship_first_name, :ship_family_name_kana, :ship_first_name_kana, presence: true
  validates :postal_code,format: {with: /\A\d{3}[_]\d{4}\z/}
end
