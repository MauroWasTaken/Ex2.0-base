class CreateOrder < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.timestamps
      t.references :client, foreign_key: true
    end
  end
end
