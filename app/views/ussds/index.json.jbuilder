json.array!(@ussds) do |ussd|
  json.extract! ussd, :id, :sessionId, :serviceCode, :phoneNumber
  json.url ussd_url(ussd, format: :json)
end
