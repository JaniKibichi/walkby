json.array!(@dtmfs) do |dtmf|
  json.extract! dtmf, :id, :isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount
  json.url dtmf_url(dtmf, format: :json)
end
