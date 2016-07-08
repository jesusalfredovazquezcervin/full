class Agenda < ActiveRecord::Base
  belongs_to :cliente
  validates :cliente_id, :nombre, :rfc, :calle, :numero, :colonia, :delegacion, :estado, :cp,
            presence: true
  validates :email,
            uniqueness: true, allow_blank: true
  validates :rfc,
            uniqueness: true, allow_blank: true
  validates :cliente_id,
            uniqueness:  {scope: [:rfc]}
end
