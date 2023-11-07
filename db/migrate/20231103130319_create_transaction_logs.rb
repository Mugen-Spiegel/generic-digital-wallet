class CreateTransactionLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_logs, id: false do |t|
      t.string :id, null: false
      t.string :type, null: false
      t.integer :currency
      t.decimal :amount, :precision => 8, :scale => 2
      t.belongs_to :parent, null: true, type: :string
      t.references :sender, null: true, foreign_key: {to_table: :entities}
      t.references :reciever, null: true, foreign_key: {to_table: :entities}
      t.boolean :status, null: true
      t.timestamps
    end
    add_index :transaction_logs, :id, unique: true

  end
end
