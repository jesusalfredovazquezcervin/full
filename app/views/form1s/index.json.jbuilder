json.array!(@form1s) do |form1|
  json.extract! form1, :id, :cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field15, :field16, :field17, :field18, :field19, :field20
  json.url form1_url(form1, format: :json)
end
