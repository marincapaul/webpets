class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
    add_index :posts, [:pet_id, :created_at]
  end
end
