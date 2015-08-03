json.array!(@airtimes) do |airtime|
  json.extract! airtime, :id, :status, :amount, :phoneNumber, :discount, :requestId
  json.url airtime_url(airtime, format: :json)
end
