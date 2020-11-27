class Info < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to :order

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :add
    validates :bldg
    validates :tel, numericality: { only_integer: true, message: 'Input only number' }
    validates :order
  end
end
