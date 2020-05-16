class CreateExampleSentences < ActiveRecord::Migration[6.0]
  def change
    create_table :example_sentences do |t|
      t.string :name, comment: '名前'
      t.string :translation, comment: '翻訳'
      t.references :word, null: false, foreign_key: true, comment: 'word_id' 

      t.timestamps
    end
  end
end
