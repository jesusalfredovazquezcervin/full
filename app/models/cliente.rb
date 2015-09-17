class Cliente < ActiveRecord::Base
  has_one :direccion
  has_one :formapago
  validates :nombre,
            presence: true,
            uniqueness: {scope: :rfc}
  validates :rfc,
            presence: true



end
