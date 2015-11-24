json.array!(@notifications) do |notification|
  json.extract! notification, :id, :cliente_id, :sucursal_id, :usuario_id, :contacto_id, :status_id, :event_id, :notification, :startdate, :starttime, :duedate, :duetime
  json.url notification_url(notification, format: :json)
end
