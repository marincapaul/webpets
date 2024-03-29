class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, null: false, foreign_key: true
      t.integer :parent_id
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
