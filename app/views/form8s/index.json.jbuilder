json.array!(@form8s) do |form8|
  json.extract! form8, :id, :cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field14, :field15, :field16, :field17, :field18, :field19, :field20
  json.url form8_url(form8, format: :json)
end
