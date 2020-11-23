class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id
    validates :statusu_id
    validates :fee_id
    validates :area_id
    validates :days_id
    validates :price
    validates :user_id, foreign_key: true
  end
end
