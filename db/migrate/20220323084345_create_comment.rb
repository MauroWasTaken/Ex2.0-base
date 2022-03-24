class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |c|
      c.string :content
      c.references :author, foreign_key: {to_table: "clients"}
      c.references :target, polymorphic: true
    end
  end
end