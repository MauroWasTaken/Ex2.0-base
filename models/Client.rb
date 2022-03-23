class Client < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders

  validates :firstname, :lastname,  presence: true, length: { minimum: 2 }

  def to_s
    "#{firstname} #{lastname}"
  end
end