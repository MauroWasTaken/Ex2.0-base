class ModifyProductAddSupplier < ActiveRecord::Migration[6.1]
  def change
      add_reference :products, :supplier, :foreign_key => true
  end
end