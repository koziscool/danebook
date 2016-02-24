class Addphotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer     :user_id
      t.attachment :photo_info  
      t.timestamps null: false
      t.index   :user_id
    end
    add_column :users, :avatar_id, :integer
    add_index :users, :avatar_id

    add_column :users, :cover_photo_id, :integer
    add_index :users, :cover_photo_id
  end

end
