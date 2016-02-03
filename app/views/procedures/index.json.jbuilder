json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :cliente_id, :sucursal_id, :name
  json.url procedure_url(procedure, format: :json)
end
