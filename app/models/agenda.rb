class Agenda < ActiveRecord::Base
  belongs_to :cliente
  has_many :agenda_accounts, :dependent => :destroy
  has_many :datosgenerales, :through => :agenda_accounts

  validates :cliente_id, :nombre, :calle, :numero, :colonia, :delegacion, :estado, :cp,
            presence: true
  validates :email,
            uniqueness: true, allow_blank: true
  validates :rfc,
            uniqueness: true, allow_blank: true
  validates :cliente_id,
            uniqueness:  {scope: [:nombre], message: "La combinacion Cliente + Nombre ya esta en uso"}
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/avatar_empty.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
end
