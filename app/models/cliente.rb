class Cliente < ActiveRecord::Base
  #has_one :direccion
  has_one :formapago
  has_many :datosgenerales, :dependent => :destroy
  has_many :sucursals, :dependent => :destroy
  has_many :agendas, :dependent => :destroy
  #has_many :contactos, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :forms, :dependent => :destroy
  has_many :procedures, :dependent => :destroy
  has_many :asks, :dependent => :destroy
  has_many :contact_clients, :dependent => :destroy
  has_many :contactos, :through => :contact_clients
  validates :nombre,
            presence: true,
            uniqueness: {scope: :rfc}
  validates :rfc,
            presence: true



end
