class MensajeConfiguracion < ActiveRecord::Base
  belongs_to :cliente
  validates :cliente_id,
      uniqueness: true
  validates :cliente_id,
      presence: true

  OPCIONES = %w[captura captura_y_listado]
end
