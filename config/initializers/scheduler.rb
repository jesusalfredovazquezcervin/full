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
    Report.all.where(active: true, schedule: schedule,  periodicity: periodicity).each{|report|
      InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
      report_sent_log report.id
    }
  else
    Report.all.where(active: true, schedule: schedule,  periodicity: periodicity).each{|report|
      if report.end_day.day == report.send_same_day ? (Date.today.day):((Date.today - 1).day)
        InformationMailer.send_report(report.contactos.collect{|c| c.email }, report.id).deliver
        report_sent_log report.id
      end
    }
  end
end

# Tarea para el turno matutino

m.every 1.day, :first_at => Time.new(2016, 8, 31, 8) + 1.day  do
  #Rails.logger.info "hello, it's #{Time.now}"
  loop_reports("diario", "matutino")
  loop_reports("semanal", "matutino")
  loop_reports("quincenal", "matutino")
  loop_reports("mensual", "matutino")
  loop_reports("bimestral", "matutino")
  loop_reports("trimestral", "matutino")
  loop_reports("semestral", "matutino")
  loop_reports("anual", "matutino")
  loop_reports("varios_dias", "matutino")
end
v.every 1.day, :first_at => Time.new(2016, 8, 31, 23, 45)   do
  Rails.logger.info "vespertino, it's #{Time.now}"
  Rails.logger.debugger  "vespertino, it's #{Time.now}"
  InformationMailer.send_report("jesuscervin@icloud.com",Report.first.id ).deliver

  # loop_reports("diario", "vespertino")
  # loop_reports("semanal", "vespertino")
  # loop_reports("quincenal", "matutino")
  # loop_reports("mensual", "vespertino")
  # loop_reports("bimestral", "vespertino")
  # loop_reports("trimestral", "vespertino")
  # loop_reports("semestral", "vespertino")
  # loop_reports("anual", "vespertino")
  # loop_reports("varios_dias", "vespertino")

end
n.every 1.day, :first_at => Time.new(2016, 8, 31, 22)   do
  loop_reports("diario", "nocturno")
  loop_reports("semanal", "nocturno")
  loop_reports("quincenal", "nocturno")
  loop_reports("mensual", "nocturno")
  loop_reports("bimestral", "nocturno")
  loop_reports("trimestral", "nocturno")
  loop_reports("semestral", "nocturno")
  loop_reports("anual", "nocturno")
  loop_reports("varios_dias", "nocturno")
end



