class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
