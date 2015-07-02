json.array!(@documents) do |document|
  json.extract! document, :id, :documnet
  json.url document_url(document, format: :json)
end
