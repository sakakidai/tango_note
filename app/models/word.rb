class Word < ApplicationRecord
  belongs_to :word_book

  validates :name, presence: true
  validates :translation, presence: true
end
