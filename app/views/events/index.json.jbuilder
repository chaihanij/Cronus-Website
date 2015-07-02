json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :body, :image, :email
  json.url event_url(event, format: :json)
end
