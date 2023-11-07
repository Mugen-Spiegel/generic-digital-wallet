class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :type
      t.string :name
      t.string :email, null: false
      t.string :password_digest
      t.string :auth_token
      t.string :password_reset_token
      t.timestamps
    end
    add_index :entities, :email, unique: true
    add_index :entities, :auth_token, unique: true
  end
end
