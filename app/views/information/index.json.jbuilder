json.array!(@information) do |information|
  json.extract! information, :id, :form_id, :usuario_id, :field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10
  json.url information_url(information, format: :json)
end
