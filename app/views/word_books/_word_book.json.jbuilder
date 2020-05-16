json.extract! word_book, :id, :title, :user_id, :created_at, :updated_at
json.url word_book_url(word_book, format: :json)
