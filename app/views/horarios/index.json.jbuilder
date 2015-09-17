json.array!(@horarios) do |horario|
  json.extract! horario, :id, :nombre, :lunhini, :lunhfin, :marhini, :marhfin, :miehini, :miehfin, :juehini, :juehfin, :viehini, :viehfin, :sabhini, :sabhfin, :domhini, :domhfin
  json.url horario_url(horario, format: :json)
end
