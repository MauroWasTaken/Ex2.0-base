class CreateClient < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :type
      t.string :firstname
      t.string :lastname
    end
  end
end