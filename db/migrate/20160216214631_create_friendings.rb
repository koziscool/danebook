class CreateFriendings < ActiveRecord::Migration
  def change
    create_table :friendings do |t|
      t.integer :initiator_id
      t.integer :recipient_id

      t.timestamps null: false
    end
  end
end
