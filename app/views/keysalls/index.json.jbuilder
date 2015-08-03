json.array!(@keysalls) do |keysall|
  json.extract! keysall, :id
  json.url keysall_url(keysall, format: :json)
end
