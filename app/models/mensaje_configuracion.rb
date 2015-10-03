class MensajeConfiguracion < ActiveRecord::Base
  #belongs_to :cliente
  validates :cliente,
      uniqueness: true
end
