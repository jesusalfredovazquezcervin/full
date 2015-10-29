class Cliente < ActiveRecord::Base
  #has_one :direccion
  has_one :formapago
  has_one :datosgenerale
  has_one :mensaje_configuracion
  validates :nombre,
            presence: true,
            uniqueness: {scope: :rfc}
  validates :rfc,
            presence: true



end
