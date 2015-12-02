class Notification < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :sucursal
  belongs_to :usuario
  belongs_to :status
  belongs_to :event

  belongs_to :person, :class_name => "Contacto"
  belongs_to :recipient, :class_name => 'Contacto'

  scope :active, -> (cliente) {
    where(:cliente_id => 2).select{|m| m if (m.duedatetime.utc + (DateTime.now.utc_offset*(-1).second)  > DateTime.now.utc) }
  }
end
