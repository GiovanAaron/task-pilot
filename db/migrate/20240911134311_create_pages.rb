class CreatePages < ActiveRecord::Migration[7.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :description
      
      t.date :due_by
      t.integer :priority
      t.integer :difficulty
      t.integer :status
      t.integer :progress
      t.integer :reminder
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
