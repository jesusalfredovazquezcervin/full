class ContactClient < ActiveRecord::Base
  belongs_to :contacto
  belongs_to :cliente
  validates :contacto_id, :cliente_id,
            presence: true
end
