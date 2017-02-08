class Field < ActiveRecord::Base
  belongs_to :form, touch: true
  DATA_TYPE = {String: 'Caracteres (max 255)', Text:'Caracteres (max 2500)', Integer: 'Numeros enteros', Date: 'Fecha', DateTime:'Fecha y Hora', Boolean: 'Si/No', List:'Lista de valores'}
  BEHAVE = %w[Comun Primario Alterno]
  validates :form_id, :name,
            presence: true
  validates :form_id,
            uniqueness:  {scope: [:name], message: "La combinacion Formulario + Nombre del campo ya esta en uso"}

end
