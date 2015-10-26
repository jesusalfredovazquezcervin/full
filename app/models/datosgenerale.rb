class Datosgenerale < ActiveRecord::Base
  validates :cliente_id, :horario_id, :alta, :clavesalida, :locacion, :did, :frase,
            presence: true,
            uniqueness: true
  validates :cliente_id,
            uniqueness: true
end
