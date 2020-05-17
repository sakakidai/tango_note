class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.references :word_book, null: false, foreign_key: true, comment: 'word_book_id'
      t.string :name, comment: '名前'
      t.string :translation, comment: '翻訳'

      t.timestamps
    end
  end
end
