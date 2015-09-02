json.array!(@package_files) do |package_file|
  json.extract! package_file, :id, :package, :build_date, :release_date, :version_id, :operating_system_id, :is_public
  json.url package_file_url(package_file, format: :json)
end
