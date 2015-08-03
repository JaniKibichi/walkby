json.array!(@subscribes) do |subscribe|
  json.extract! subscribe, :id, :status, :description
  json.url subscribe_url(subscribe, format: :json)
end
