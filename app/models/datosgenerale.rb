class Datosgenerale < ActiveRecord::Base
  belongs_to :cliente
  has_many :contact_accounts, :dependent => :destroy
  has_many :contactos, :through => :contact_accounts
  has_many :procedures, :dependent => :destroy
  validates :cliente_id, :horario_id, :alta, :clavesalida, :locacion, :did, :frase,
            presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:account]}
  PERIODICITY = %w[diario semanal quincenal mensual bimestral trimestral semestral anual]

  # Si la cuenta se elimina entonces todo lo realcionado a ella debe eliminarse, como procedimientos, relaciones entre contactos y cuentas, NO los contactos.

end
