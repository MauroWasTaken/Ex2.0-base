class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :type
      t.references :client, foreign_key: true
      t.references :product, foreign_key: true
      t.references :provider, foreign_key: true
    end
  end
end