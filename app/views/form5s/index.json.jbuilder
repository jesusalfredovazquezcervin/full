json.array!(@form5s) do |form5|
  json.extract! form5, :id, :cliente_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field14, :field15, :field16, :field17, :field18, :field19, :field20
  json.url form5_url(form5, format: :json)
end
