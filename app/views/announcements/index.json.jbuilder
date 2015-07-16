json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :title, :description, :body, :image, :email, :is_public
  json.url announcement_url(announcement, format: :json)
end
