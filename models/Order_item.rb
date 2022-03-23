class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, foreign_key: 'item_id'

  scope :bulk, ->(quantity = 100) { where('quantity >= ?', quantity) }

  validates :product, :order, presence: true
  validates :quantity, numericality:{greater_than_or_equal_to: 1, only_integer: true}

  def initialize(*)
    super
    self.item_price = product.price if product
  end
  def price
    item_price * quantity
  end
end