json.array!(@dequeues) do |dequeue|
  json.extract! dequeue, :id, :isActive, :sessionId, :direction, :callerNumber, :destinationNumber, :dtmfDigits, :recordingUrl, :durationInSeconds, :currencyCode, :amount, :username, :apikey
  json.url dequeue_url(dequeue, format: :json)
end
