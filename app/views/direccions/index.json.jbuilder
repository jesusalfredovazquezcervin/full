json.array!(@direccions) do |direccion|
  json.extract! direccion, :id, :sucursal_id, :calle, :numero, :colonia, :delegacion, :cp, :telefono, :referencia, :mapsgoogle, :matriz
  json.url direccion_url(direccion, format: :json)
end
