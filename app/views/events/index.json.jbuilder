json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :body, :image, :email, :created_at, :updated_at, :is_public
  json.url event_url(event, format: :json)
end
