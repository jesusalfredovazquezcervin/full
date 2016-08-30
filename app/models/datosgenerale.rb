class Datosgenerale < ActiveRecord::Base
  belongs_to :cliente
  has_many :contact_accounts, :dependent => :destroy
  has_many :contactos, :through => :contact_accounts
  has_many :procedure_accounts, :dependent => :destroy
  has_many :procedures, :through => :procedure_accounts
  has_many :informations
  has_many :notifications, :dependent => :destroy
  has_many :asks

  has_many :agenda_accounts, :dependent => :destroy
  has_many :agendas, :through => :agenda_accounts

  has_many :report_accounts, :dependent => :destroy
  has_many :reports, :through => :report_accounts
  validates :cliente_id, :alta, :clavesalida, :locacion, :did, :frase, :account,
            presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:account]}

  # Si la cuenta se elimina entonces todo lo realcionado a ella debe eliminarse, como procedimientos, relaciones entre contactos y cuentas, NO los contactos.

end
