class Cliente < ActiveRecord::Base
  #has_one :direccion
  has_one :formapago
  has_one :datosgenerale
  has_one :mensaje_configuracion
  has_many :sucursals
  has_many :agendas
  has_many :contactos
  has_many :notifications
  has_many :products
  has_many :forms
  validates :nombre,
            presence: true,
            uniqueness: {scope: :rfc}
  validates :rfc,
            presence: true



end
