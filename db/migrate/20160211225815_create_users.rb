class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :username
      t.string      :email
      t.string      :sex
      t.datetime  :birthday
      t.string      :auth_token
      t.string      :password_digest
      t.timestamps null: false
    end

    add_index :users, :auth_token, :unique => true
  end
end

