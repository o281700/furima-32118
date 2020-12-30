class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  has_many :comments

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
    with_options numericality: { other_than: 1, message: 'status Select' } do
      validates :category_id
      validates :status_id
      validates :fee_id
      validates :area_id
      validates :day_id
    end
    validates :price, numericality: { only_integer: true, message: 'Half-width number' },
                      inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
    validates :user_id
  end
end
