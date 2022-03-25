class Category < ActiveRecord::Base
    has_many :products
    def self.unused
        return Category.all.select{|c| c.products.empty?}
    end
end 