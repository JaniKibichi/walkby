json.array!(@calls) do |call|
  json.extract! call, :id, :isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount
  json.url call_url(call, format: :json)
end
