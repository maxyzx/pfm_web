class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :category
      t.decimal :amount
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
