class Notification < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :sucursal
  belongs_to :usuario
  belongs_to :contacto
  belongs_to :status
  belongs_to :event
end
