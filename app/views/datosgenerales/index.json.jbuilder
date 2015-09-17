json.array!(@datosgenerales) do |datosgenerale|
  json.extract! datosgenerale, :id, :alta, :actualizacion, :clavesalida, :locacion, :did, :telenrutados, :contacto1_id, :contacto2_id, :contacto3_id, :contacto4_id, :contacto5_id, :telefono1, :telefono2, :telefono3, :telefono4, :telefono5, :fax, :giro, :procedimiento, :paginaweb
  json.url datosgenerale_url(datosgenerale, format: :json)
end
