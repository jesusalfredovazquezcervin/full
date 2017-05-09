class Contacto < ActiveRecord::Base
  #belongs_to :cliente
  has_many :contact_accounts, :dependent => :destroy
  has_many :datosgenerales, :through => :contact_accounts
  has_many :notifications, :class_name => 'Notification', :foreign_key => 'person_id', :dependent => :destroy
  has_many :direccions, :class_name => "Direccion", :foreign_key => "main_id"
  has_many :direccions, :class_name => "Direccion", :foreign_key => "secondary_id"
  has_many :reports, :through => :report_recipients
  has_many :report_recipients, :dependent => :destroy
  has_one :usuario
  has_many :contact_clients, :dependent => :destroy
  has_many :clientes, :through => :contact_clients
  validates :nombre, :telefono, :puesto,
      presence: true
  validates :email, :skype,
      uniqueness: true, allow_blank: true
  scope :de_cliente, -> (cliente) { where("cliente_id = ?", cliente) }
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/avatar_empty.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
end
