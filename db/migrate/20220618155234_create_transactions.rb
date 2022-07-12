class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :input_amount
      t.decimal :output_amount
      t.string :input_currency
      t.string :output_currency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
