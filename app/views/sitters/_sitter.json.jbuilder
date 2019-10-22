json.extract! sitter, :id, :name, :description, :email, :age, :location, :created_at, :updated_at
json.url sitter_url(sitter, format: :json)
