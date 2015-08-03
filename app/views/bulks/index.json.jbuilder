json.array!(@bulks) do |bulk|
  json.extract! bulk, :id
  json.url bulk_url(bulk, format: :json)
end
