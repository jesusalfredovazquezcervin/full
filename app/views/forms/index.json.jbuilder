json.array!(@forms) do |form|
  json.extract! form, :id, :name, :cliente_id
  json.url form_url(form, format: :json)
end
