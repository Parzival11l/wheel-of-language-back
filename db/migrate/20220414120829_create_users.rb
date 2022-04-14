class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :password, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :login, null: false
      t.integer :role, default: 0
      t.string :jti, null: false
      t.timestamps
    end
    add_index :users, :login, unique: true
    add_index :users, :jti, unique: true
  end
end
