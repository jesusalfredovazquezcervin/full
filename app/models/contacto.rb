class Contacto < ActiveRecord::Base
  belongs_to :cliente
  validates :cliente_id, :nombre, :sucursal_id, :telefono, :puesto,
      presence: true
  validates :email, :skype,
      uniqueness: true, allow_blank: true
  validates :cliente_id,
            uniqueness:  {scope: [:sucursal_id, :nombre]}
  scope :de_cliente, -> (cliente) { where("cliente_id = ?", cliente) }
end
