class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :api_key
      t.string :password_digest
    end
    add_index :users, :email, unique: true
    add_index :users, :api_key, unique: true
  end
end
