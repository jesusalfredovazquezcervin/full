json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :rfc
  json.url cliente_url(cliente, format: :json)
end
