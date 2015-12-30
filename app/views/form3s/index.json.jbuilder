json.array!(@form3s) do |form3|
  json.extract! form3, :id, :cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field15, :field16, :field17, :field18, :field19, :field20
  json.url form3_url(form3, format: :json)
end
