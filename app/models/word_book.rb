class WordBook < ApplicationRecord
  belongs_to :user
  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
end
