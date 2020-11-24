class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    with_options numericality: { other_than: 1,  message: 'status Select'} do
      validates :category_id
      validates :status_id
      validates :fee_id
      validates :area_id
      validates :days_id
    end
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
    validates :user_id
  end
end