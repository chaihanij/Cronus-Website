json.array!(@images) do |image|
  json.extract! image, :id, :title, :alt
  json.url image_url(image, format: :json)
end
