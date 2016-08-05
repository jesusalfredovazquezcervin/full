class ProcedureAccount < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :datosgenerale
  validates :procedure_id, :datosgenerale_id,
      presence: true
end
