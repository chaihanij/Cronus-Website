json.array!(@packages) do |package|
  json.extract! package, :id, :product_id, :operating_system_id, :name, :version, :package, :release_note, :release_package, :emergency_package, :notwork_package, :is_public
  json.url package_url(package, format: :json)
end
