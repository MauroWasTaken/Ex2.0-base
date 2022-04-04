class Category < ActiveRecord::Base
    has_many :products
    has_many :order_items, through: :products
    has_many :orders, through: :products
    def self.unused
        return Category.all.select{|c| c.order_items.empty?}
    end
    def self.unusedDB
        return where.not(id: joins(:orders))
    end
end 