class CreateWordBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :word_books do |t|
      t.references :user, null: false, foreign_key: true, comment: 'user_id'
      t.string :title, comment: 'タイトル'

      t.timestamps
    end
  end
end
