json.array!(@captures) do |capture|
  json.extract! capture, :id, :ticket, :fecha, :fecha, :hora, :para
  json.url capture_url(capture, format: :json)
end
