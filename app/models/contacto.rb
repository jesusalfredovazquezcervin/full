class Contacto < ActiveRecord::Base
  belongs_to :cliente
  has_many :notifications, :class_name => 'Notification', :foreign_key => 'person_id', :dependent => :destroy
  validates :cliente_id, :nombre, :sucursal_id, :telefono, :puesto,
      presence: true
  validates :email, :skype,
      uniqueness: true, allow_blank: true
  validates :cliente_id,
            uniqueness:  {scope: [:sucursal_id, :nombre]}
  scope :de_cliente, -> (cliente) { where("cliente_id = ?", cliente) }
end
