class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :role,
            presence: true


  ROLES = %w[admin operador consulta]

  # def role_symbols
  #   roles.map do |role|
  #     role.name.underscore.to_sym
  #   end
  # end
end
