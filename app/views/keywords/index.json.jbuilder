json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :from, :to, :text, :date, :smsId, :linkId
  json.url keyword_url(keyword, format: :json)
end
