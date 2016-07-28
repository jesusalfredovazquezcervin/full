class Ask < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :usuario
  belongs_to :datosgenerale
  validates :cliente_id, :question, :datosgenerale_id,
            presence: true

end
