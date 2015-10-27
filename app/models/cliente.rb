class Cliente < ActiveRecord::Base
  has_one :direccion
  has_one :formapago
  has_one :datosgenerale
  validates :nombre,
            presence: true,
            uniqueness: {scope: :rfc}
  validates :rfc,
            presence: true



end
