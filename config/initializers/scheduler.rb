require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
#m = Rufus::Scheduler.singleton # Para el turno matutino
v = Rufus::Scheduler.new
n = Rufus::Scheduler.new
m = Rufus::Scheduler.new

def report_sent_log(report_id)

  ReportSent.create(report_id: report_id, sent_by: "scheduler", sent_to:Report.find(report_id).contactos.collect{|c| c.email }.join(','))
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
today = Time.new(Date.today.year, Date.today.month, Date.today.day)
mat=Time.new(Date.today.year, Date.today.month, Date.today.day, 7)
vesp=Time.new(Date.today.year, Date.today.month, Date.today.day, 15)
noct=Time.new(Date.today.year, Date.today.month, Date.today.day, 22)
if Time.now > mat
  mat=Time.new((today + 1.day).year, (today + 1.day).month, (today + 1.day).day, 7)
end
if Time.now > vesp
  vesp=Time.new((today + 1.day).year, (today + 1.day).month, (today + 1.day).day, 15)
end
if Time.now > noct
  noct=Time.new((today + 1.day).year, (today + 1.day).month, (today + 1.day).day, 22)
end
m.every 1.day, :first_at => Time.new(2017, 3, 16, 7)  do # 7am horas
#m.every 1.day, :first_at => mat do
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

#m.every  "2m" do
#v.every 1.day, :first_at => Time.new(2016, 9, 1, 19,10)  do # 2 pm
#v.cron '10 21 * * *' do

v.every 1.day, :first_at => Time.new(2017, 3, 15, 15)  do # 3 pm#
#v.every 1.day, :first_at => vesp  do
  #InformationMailer.send_report("jesuscervin@icloud.com, jesusalfredovazquezcervin@gmail.com",Report.first.id).deliver
  loop_reports("diario", "vespertino")
  loop_reports("semanal", "vespertino")
  loop_reports("quincenal", "matutino")
  loop_reports("mensual", "vespertino")
  loop_reports("bimestral", "vespertino")
  loop_reports("trimestral", "vespertino")
  loop_reports("semestral", "vespertino")
  loop_reports("anual", "vespertino")
  loop_reports("varios_dias", "vespertino")


end
n.every 1.day, :first_at => Time.new(2017, 3, 15, 22)  do # 10 pm
#n.every 1.day, :first_at => noct  do
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



