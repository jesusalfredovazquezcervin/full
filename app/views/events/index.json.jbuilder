json.array!(@events) do |event|
  json.extract! event, :id, :event
  json.url event_url(event, format: :json)
end
