json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :usuario_id, :checkin
  json.url checkin_url(checkin, format: :json)
end
