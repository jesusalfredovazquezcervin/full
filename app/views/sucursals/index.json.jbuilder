json.array!(@sucursals) do |sucursal|
  json.extract! sucursal, :id, :cliente_id, :nombre, :telefono, :contacto_id
  json.url sucursal_url(sucursal, format: :json)
end
