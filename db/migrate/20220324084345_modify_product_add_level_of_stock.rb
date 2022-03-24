class ModifyProductAddLevelOfStock < ActiveRecord::Migration[6.1]
  def change
      add_column  :products,:level_of_stock, :integer
  end
end