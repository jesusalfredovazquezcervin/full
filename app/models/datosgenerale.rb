class Datosgenerale < ActiveRecord::Base
  belongs_to :cliente
  has_many :contact_accounts
  has_many :contactos, :through => :contact_accounts
  validates :cliente_id, :horario_id, :alta, :clavesalida, :locacion, :did, :frase,
            presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:account]}
  PERIODICITY = %w[diario semanal quincenal mensual bimestral trimestral semestral anual]
end
