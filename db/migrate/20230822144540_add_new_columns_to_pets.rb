class AddNewColumnsToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :gender, :integer
    add_column :pets, :description, :string
    add_column :pets, :color, :string
  end
end
