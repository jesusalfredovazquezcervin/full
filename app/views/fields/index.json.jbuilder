json.array!(@fields) do |field|
  json.extract! field, :id, :form_id, :name, :type, :mandatory, :show_in_list
  json.url field_url(field, format: :json)
end
