class ContactAccount < ActiveRecord::Base
  belongs_to :contacto
  belongs_to :datosgenerale
  validates :contacto_id, :datosgenerale_id,
      presence: true
end
