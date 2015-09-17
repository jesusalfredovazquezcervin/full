json.array!(@pruebas) do |prueba|
  json.extract! prueba, :id, :clave, :nombre
  json.url prueba_url(prueba, format: :json)
end
