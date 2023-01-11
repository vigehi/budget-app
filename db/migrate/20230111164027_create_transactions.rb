class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :amount
      t.integer :category

      t.timestamps
    end
  end
end
