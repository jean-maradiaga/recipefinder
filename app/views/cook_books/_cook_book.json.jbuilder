json.extract! cook_book, :id, :name, :description, :user_id, :created_at, :updated_at
json.url cook_book_url(cook_book, format: :json)