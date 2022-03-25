class Client < ActiveRecord::Base
  has_many :orders
  has_many :products, through: :orders
  has_many :comments, foreign_key: :author_id
  validates :firstname, :lastname,  presence: true, length: { minimum: 2 }

  def to_s
    "#{firstname} #{lastname}"
  end
  def self.inactive
    return Client.includes(:orders).where( orders: {:client_id=>nil} )
  end
  def self.RemoveInactive
    Client.inactive.each{ |c| c.destroy}   
  end
end