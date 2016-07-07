json.array!(@logs) do |log|
  json.extract! log, :id, :usuario_id, :action, :detail, :field
  json.url log_url(log, format: :json)
end
