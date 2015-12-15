json.array!(@orders) do |order|
  json.extract! order, :id, :agenda_id, :usuario_id, :cliente_id
  json.url order_url(order, format: :json)
end
