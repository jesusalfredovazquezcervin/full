json.array!(@asks) do |ask|
  json.extract! ask, :id, :cliente_id, :usuario_id, :question, :asked_by, :answer, :answer_by, :answer_date, :voting, :subject
  json.url ask_url(ask, format: :json)
end
