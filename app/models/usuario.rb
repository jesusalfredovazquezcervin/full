class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role,
            presence: true


  ROLES = %w[admin operador consulta supervisor]

  belongs_to :contacto
  has_one :information, foreign_key: :userupdate_id

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/avatar_empty.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
end
