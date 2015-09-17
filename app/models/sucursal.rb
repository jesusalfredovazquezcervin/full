class Sucursal < ActiveRecord::Base
  belongs_to :cliente
  has_one :contacto
  validates :cliente_id, :nombre,
            presence: true
  validates :nombre,
            uniqueness: {scope: :cliente_id}
end
