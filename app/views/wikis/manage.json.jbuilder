json.array!(@wikis) do |wiki|
  json.extract! wiki, :id, :title, :description, :parent_id, :lft, :rgt, :depth, :children_count, :created_at, :updated_at
  json.url wiki_url(wiki, format: :json)
end
