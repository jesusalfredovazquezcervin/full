class Sucursal < ActiveRecord::Base
  belongs_to :cliente
  has_one :contacto
  has_one :direccion, :dependent => :destroy
  has_one :horario, :dependent => :destroy
  belongs_to :main, class_name: "Contacto"
  belongs_to :secondary, class_name: "Contacto"
  validates :cliente_id, :nombre,
            presence: true
  validates :nombre,
            uniqueness: {scope: :cliente_id}
end
