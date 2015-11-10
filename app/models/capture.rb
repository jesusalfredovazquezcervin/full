class Capture < ActiveRecord::Base
  belongs_to :cliente
  validates :cliente_id,
            presence: true

  TIPOLLAMADA = %w[tipo1 tipo2 tipo3] #tipoLlamada - Pendiente lista de valores
  PAIS = %w[tipo1 tipo2 tipo3] #paisOrigino -  Pendiente lista de valores
  FILIACION = %w[tipo1 tipo2 tipo3] #relacionPaciente -  Pendiente lista de valores
  INTENSIDADSENAL = %w[tipo1 tipo2 tipo3] #intensidadSenal -  Pendiente lista de valores
  DISPOSITIVO = %w[pc-escritorio laptop tablet movil] #dispositivo
  FORMAPAGO = %w[efectivo tarjeta cheque transferencia deposito] #formaPagoFianza

end
