class Report < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :datosgenerale
  belongs_to :form
  has_many :detail_reports
  has_many :report_sents
  has_many :report_accounts, :dependent => :destroy
  has_many :datosgenerales, :through => :report_accounts
  has_many :contactos, :through => :report_recipients
  has_many :report_recipients, :dependent => :destroy
  PERIODICITY = %w[diario semanal quincenal mensual bimestral trimestral semestral anual varios_dias]
  SCHEDULE = %w[matutino vespertino nocturno]
  validates :name, :cliente_id, :periodicity, :schedule, :form_id, :start_day, :end_day,
      :presence => true
  validates :cliente_id,
            uniqueness:  {scope: [ :name]}

  scope :activos, where(:active => true)
end
