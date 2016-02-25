class Cliente < ActiveRecord::Base
  #has_one :direccion
  has_one :formapago
  has_one :datosgenerale, :dependent => :destroy
  has_many :sucursals, :dependent => :destroy
  has_many :agendas, :dependent => :destroy
  has_many :contactos, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :forms, :dependent => :destroy
  has_many :procedures, :dependent => :destroy
  validates :nombre,
            presence: true,
            uniqueness: {scope: :rfc}
  validates :rfc,
            presence: true



end
