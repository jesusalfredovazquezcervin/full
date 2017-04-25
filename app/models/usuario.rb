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
end
