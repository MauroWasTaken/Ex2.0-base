class Client < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders
  has_many :comments, foreign_key: :author_id
  validates :firstname, :lastname,  presence: true, length: { minimum: 2 }
  def to_s
    "#{firstname} #{lastname}"
  end
  def inactive
    left_joins(:orders).where( orders: { :id nil } )
  end
  def inactive
    where.missing( :orders)
  end
end