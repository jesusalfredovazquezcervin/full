json.array!(@sents) do |sent|
  json.extract! sent, :id, :usuario_id, :information_id, :recipient
  json.url sent_url(sent, format: :json)
end
