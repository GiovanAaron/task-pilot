class CreateAttachments < ActiveRecord::Migration[7.2]
  def change
    create_table :attachments do |t|
      t.string :file_path
      t.references :pages, null: false, foreign_key: true

      t.timestamps
    end
  end
end
