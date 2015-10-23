json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :cliente_id, :nombre, :rfc, :calle, :numero, :colonia, :delegacion, :estado, :cp, :email, :telefono, :cel
  json.url agenda_url(agenda, format: :json)
end
