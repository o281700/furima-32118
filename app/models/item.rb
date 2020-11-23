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
    validates :category_id, numericality: { other_than: 1 } 
    validates :statusu_id, numericality: { other_than: 1 } 
    validates :fee_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :days_id, numericality: { other_than: 1 } 
    validates :price
    validates :user_id, foreign_key: true
  end
end
