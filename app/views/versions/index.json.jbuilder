json.array!(@versions) do |version|
  json.extract! version, :id, :name, :description, :is_pubile, :product_id
  json.url version_url(version, format: :json)
end
