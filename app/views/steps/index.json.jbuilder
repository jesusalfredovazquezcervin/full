json.array!(@steps) do |step|
  json.extract! step, :id, :procedure_id, :name, :detail, :number
  json.url step_url(step, format: :json)
end
