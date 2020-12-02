class OrderForm
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :add, :bldg, :tel, :order_id, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :area_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :add
    validates :tel, numericality: { only_integer: true, message: 'Input only number' }, length: { maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Info.create(postal: postal, area_id: area_id, city: city, add: add, bldg: bldg, tel: tel, order_id: order.id)
  end
end
