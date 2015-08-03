json.array!(@pickcalls) do |pickcall|
  json.extract! pickcall, :id, :isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount, :username, :apikey
  json.url pickcall_url(pickcall, format: :json)
end
