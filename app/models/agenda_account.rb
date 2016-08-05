class AgendaAccount < ActiveRecord::Base
  belongs_to :agenda
  belongs_to :datosgenerale
  validates :agenda_id, :datosgenerale_id,
            presence: true
end
