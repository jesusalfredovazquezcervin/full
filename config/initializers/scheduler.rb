require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
m = Rufus::Scheduler.singleton # Para el turno matutino
v = Rufus::Scheduler.singleton # Para el turno vespertino
n = Rufus::Scheduler.singleton # Para el turno nocturno
r = Report.last

#start_at = Time.new(Date.today.year, Date.today.month, Date.today.day, 19,33,0) # este es de prueba luego quitarlo
#PERIODICITY = %w[diario semanal quincenal mensual bimestral trimestral semestral anual]
# Tarea para el turno matutino
#m.every 1.day, :first_at => Time.new(Date.today.year, Date.today.month, Date.today.day, 9,0,0) do
m.every 1.day, :first_at => Time.new(Date.today.year, Date.today.month, Date.today.day + 1.day, 8,0,0) do
  #Rails.logger.info "hello, it's #{Time.now}"
  loop_reports("diario", "matutino")
  loop_reports("diario", "semanal")
  loop_reports("diario", "quincenal")
  loop_reports("diario", "mensual")
  loop_reports("diario", "bimestral")
  loop_reports("diario", "trimestral")
  loop_reports("diario", "semestral")
  loop_reports("diario", "anual")
  # Report.enabled.all.where(schedule: "matutino",  periodicity: "diario").each{|report|
  #   InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
  #   report_sent_log report.id
  # }
end

# Tarea para el turno vespertino
v.every 1.day, :first_at => Time.new(Date.today.year, Date.today.month, Date.today.day, 14,0,0) do
  # Report.all.where(schedule: "vespertino",  periodicity: "semanal").each{|report|
  #   if report.end_day.day == report.send_same_day ? (Date.today.day):((Date.today - 1).day)
  #     InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
  #     report_sent_log report.id
  #     Rails.logger.info "Enviando vespertino, semanal#{Time.now}"
  #   end
  # }
  loop_reports("vespertino", "matutino")
  loop_reports("vespertino", "semanal")
  loop_reports("vespertino", "quincenal")
  loop_reports("vespertino", "mensual")
  loop_reports("vespertino", "bimestral")
  loop_reports("vespertino", "trimestral")
  loop_reports("vespertino", "semestral")
  loop_reports("vespertino", "anual")
end

# Tarea para el turno nocturno
n.every 1.day, :first_at => Time.new(Date.today.year, Date.today.month, Date.today.day, 22,0,0) do
  loop_reports("nocturno", "matutino")
  loop_reports("nocturno", "semanal")
  loop_reports("nocturno", "quincenal")
  loop_reports("nocturno", "mensual")
  loop_reports("nocturno", "bimestral")
  loop_reports("nocturno", "trimestral")
  loop_reports("nocturno", "semestral")
  loop_reports("nocturno", "anual")
end


def loop_reports(periodicity, schedule)
  if periodicity == "diario"
    Report.enabled.all.where(schedule: schedule,  periodicity: periodicity).each{|report|
      InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
      report_sent_log report.id
    }
  else
    Report.enabled.all.where(schedule: schedule,  periodicity: periodicity).each{|report|
      if report.end_day.day == report.send_same_day ? (Date.today.day):((Date.today - 1).day)
        InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
        report_sent_log report.id
      end
    }
  end
end


def report_sent_log(report_id)
  ReportSent.create(report_id: report_id, sent_by: "scheduler")
end
