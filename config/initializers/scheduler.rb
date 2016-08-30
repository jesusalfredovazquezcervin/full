require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
m = Rufus::Scheduler.singleton # Para el turno matutino
v = Rufus::Scheduler.singleton # Para el turno vespertino
n = Rufus::Scheduler.singleton # Para el turno nocturno

def report_sent_log(report_id)
  ReportSent.create(report_id: report_id, sent_by: "scheduler")
end
def loop_reports(periodicity, schedule)
  if periodicity == "diario"
    Report.active.all.where(schedule: schedule,  periodicity: periodicity).each{|report|
      InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
      report_sent_log report.id
    }
  else
    Report.active.all.where(schedule: schedule,  periodicity: periodicity).each{|report|
      if report.end_day.day == report.send_same_day ? (Date.today.day):((Date.today - 1).day)
        InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
        report_sent_log report.id
      end
    }
  end
end

# Tarea para el turno matutino

m.every 1.day, :first_at => Time.new(2016, 8, 30, 8) + 1.day  do
  #Rails.logger.info "hello, it's #{Time.now}"
  loop_reports("vespertino", "matutino")
  loop_reports("vespertino", "semanal")
  loop_reports("vespertino", "quincenal")
  loop_reports("vespertino", "mensual")
  loop_reports("vespertino", "bimestral")
  loop_reports("vespertino", "trimestral")
  loop_reports("vespertino", "semestral")
  loop_reports("vespertino", "anual")
end
v.every 1.day, :first_at => Time.new(2016, 8, 30, 14,30)   do
  loop_reports("vespertino", "matutino")
  loop_reports("vespertino", "semanal")
  loop_reports("vespertino", "quincenal")
  loop_reports("vespertino", "mensual")
  loop_reports("vespertino", "bimestral")
  loop_reports("vespertino", "trimestral")
  loop_reports("vespertino", "semestral")
  loop_reports("vespertino", "anual")
end
n.every 1.day, :first_at => Time.new(2016, 8, 30, 22)   do
  loop_reports("nocturno", "matutino")
  loop_reports("nocturno", "semanal")
  loop_reports("nocturno", "quincenal")
  loop_reports("nocturno", "mensual")
  loop_reports("nocturno", "bimestral")
  loop_reports("nocturno", "trimestral")
  loop_reports("nocturno", "semestral")
  loop_reports("nocturno", "anual")
end



