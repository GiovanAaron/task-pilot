class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :user
      t.string :title
      t.date :posted_at
      t.text :body
      t.string :attachment
      t.references :pages, null: false, foreign_key: true

      t.timestamps
    end
  end
end
