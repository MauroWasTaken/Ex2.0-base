class CreateJoinTableOrderItem < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :product, :foreign_key => true
      t.references :order, foreign_key: {on_delete: :cascade}
      t.integer :quantity
      t.decimal :item_price, precision: 10, scale: 2
    end
  end
end