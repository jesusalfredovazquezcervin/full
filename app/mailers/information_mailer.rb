class InformationMailer < ActionMailer::Base
  default from: "operaciones@ofintel.com.mx"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.information_mailer.daily.subject
  #
  def daily(email,id)
    @information = Information.find_by_id(id)
    mail to: email,
    subject: "Ofintel::Mensaje de " << @information.form.name.capitalize
  end
  def send_report(email, report_id)
    @report = Report.find_by_id report_id
    @today = @report.send_same_day ? (Date.today):(Date.today - 1.day)
    case @report.periodicity
      when "diario"
        date_start = @today - 1.day
        @ff = DateTime.new(@today.year, @today.month, @today.day, @report.end_day.hour, @report.end_day.min, @report.end_day.sec)
        @fi = DateTime.new(@today.year , @today.month, @today.day, @report.start_day.hour, @report.start_day.min, @report.start_day.sec)
      when "semanal"
        date_start = @today - 1.week
      when "quincenal"
        date_start = @today - 2.weeks
      when "mensual"
        date_start = @today - 1.month
      when "bimestral"
        date_start = @today - 2.months
      when "trimestral"
        date_start = @today - 3.months
      when "semestral"
        date_start = @today - 6.months
      when "anual"
        date_start = @today - 1.year
      when "varios_dias"
        diff_days = (@report.end_day.to_date - @report.start_day.to_date).to_i
        date_start = @ff - diff_days.day
    end
    if @report.periodicity != "diario"
      @fi = DateTime.new(date_start.year , date_start.month, date_start.day, @report.start_day.hour, @report.start_day.min, @report.start_day.sec)
      @ff = DateTime.new(@today.year, @today.month, @today.day, @report.end_day.hour, @report.end_day.min, @report.end_day.sec)
    end



    @enlace = url_for(controller: "reports", action: "sent", id: @report.id.to_s, date: @today.strftime("%Y%m%d"))
    #@enlace = @enlace.sub(/ofintel.tk/,'ofintel.ml')
    mail to: email.join(", "),
    #mail to: email,
    subject: "Ofintel::Reporte - " << @report.name.titleize
  end
end
