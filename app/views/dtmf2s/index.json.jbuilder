json.array!(@dtmf2s) do |dtmf2|
  json.extract! dtmf2, :id, :isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount
  json.url dtmf2_url(dtmf2, format: :json)
end
