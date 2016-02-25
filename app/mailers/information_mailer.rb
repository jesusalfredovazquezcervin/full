class InformationMailer < ActionMailer::Base
  default from: "from@example.com"

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
end
