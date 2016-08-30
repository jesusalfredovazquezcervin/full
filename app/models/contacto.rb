class Contacto < ActiveRecord::Base
  belongs_to :cliente
  has_many :contact_accounts, :dependent => :destroy
  has_many :datosgenerales, :through => :contact_accounts
  has_many :notifications, :class_name => 'Notification', :foreign_key => 'person_id', :dependent => :destroy
  has_many :direccions, :class_name => "Direccion", :foreign_key => "main_id"
  has_many :direccions, :class_name => "Direccion", :foreign_key => "secondary_id"
  has_many :reports, :through => :report_recipients
  has_many :report_recipients, :dependent => :destroy
  validates :cliente_id, :nombre, :telefono, :puesto,
      presence: true
  validates :email, :skype,
      uniqueness: true, allow_blank: true
  validates :cliente_id,
            uniqueness:  {scope: [ :nombre]}
  scope :de_cliente, -> (cliente) { where("cliente_id = ?", cliente) }

end
