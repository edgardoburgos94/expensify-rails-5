class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.integer :expense_type
      t.date :date
      t.string :concept
      t.references :category, foreign_key: true, index: true
      t.float :amount

      t.timestamps
    end
  end
end
