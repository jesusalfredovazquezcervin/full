class Horario < ActiveRecord::Base
  validates :cliente_id, :sucursal_id, :nombre,
            presence: true
  validates :sucursal_id,
            uniqueness: {scope: :cliente_id}
  validates :lunhini, :lunhfin, :marhini, :marhfin, :miehini, :miehfin, :juehini, :juehfin, :viehini, :viehfin, :sabhini, :sabhfin, :domhini, :domhfin,
            presence:true, allow_blank: true
  belongs_to :cliente
end
