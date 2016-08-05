class Notification < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :sucursal
  belongs_to :usuario
  belongs_to :status
  belongs_to :event
  belongs_to :datosgenerale
  belongs_to :person, :class_name => "Contacto"
  belongs_to :recipient, :class_name => "Contacto"
  validates :person_id, :event_id, :startdatetime, :duedatetime, :notification,
            presence: true

=begin
  scope :active, -> (cliente) {
    where(:cliente_id => 2).select{|m| m if (m.duedatetime.utc + (DateTime.now.utc_offset*(-1).second)  > DateTime.now.utc) }
  }
=end

  scope :active, -> {
    where("duedatetime > ?", DateTime.now )
  }
end
