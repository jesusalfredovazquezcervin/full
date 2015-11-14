class Sucursal < ActiveRecord::Base
  belongs_to :cliente
  has_one :contacto
  has_one :direccion
  has_one :horario
  validates :cliente_id, :nombre,
            presence: true
  validates :nombre,
            uniqueness: {scope: :cliente_id}
end
