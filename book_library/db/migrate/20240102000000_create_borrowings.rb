class CreateBorrowings < ActiveRecord::Migration[8.0]
    def change
      create_table :borrowings do |t|
        t.references :book, null: false, foreign_key: true
        t.string :borrower_name, null: false
        t.datetime :borrowed_at, null: false
        t.datetime :returned_at
  
        t.timestamps
      end
      
      add_index :borrowings, :borrower_name
    end
  end