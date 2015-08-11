json.array!(@documents) do |document|
  json.extract! document, :id, :name, :description, :document, :is_public, :product_id
  json.url document_url(document, format: :json)
end
