json.array!(@contactos) do |contacto|
  json.extract! contacto, :id, :nombre, :telefono, :ext, :cel, :email, :puesto
  json.url contacto_url(contacto, format: :json)
end
