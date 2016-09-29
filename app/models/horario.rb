class Horario < ActiveRecord::Base
  validates :cliente_id, :sucursal_id, :nombre,
            presence: true
  validates :sucursal_id,
            uniqueness: {scope: :cliente_id}
  validates :lunhini, :lunhfin, :marhini, :marhfin, :miehini, :miehfin, :juehini, :juehfin, :viehini, :viehfin, :sabhini, :sabhfin, :domhini, :domhfin,
            presence:true, allow_blank: true
  belongs_to :cliente
  has_many :datosgenerales
  def horario_semana
    horario_semana = "L "
    if(lunhini.nil? || lunhfin.nil? )
      horario_semana = horario_semana << "N/L |"
    else
      horario_semana = horario_semana << lunhini.strftime("%I:%M%p") << "-" << lunhfin.strftime("%I:%M%p") << " | "
    end

    horario_semana = horario_semana << "M "
    if(marhini.nil? || marhfin.nil? )
      horario_semana = horario_semana << "N/L |"
    else
      horario_semana = horario_semana << marhini.strftime("%I:%M%p") << "-" << marhfin.strftime("%I:%M%p") << " | "
    end

    horario_semana = horario_semana << "W "
    if(miehini.nil? || miehfin.nil? )
      horario_semana = horario_semana << "N/L |"
    else
      horario_semana = horario_semana << miehini.strftime("%I:%M%p") << "-" << miehfin.strftime("%I:%M%p") << " | "
    end


    horario_semana = horario_semana << "J "
    if(juehini.nil? || juehfin.nil? )
      horario_semana = horario_semana << "N/L |"
    else
      horario_semana = horario_semana << juehini.strftime("%I:%M%p") << "-" << juehfin.strftime("%I:%M%p") << " | "
    end

    horario_semana = horario_semana << "V "
    if(viehini.nil? || viehfin.nil? )
      horario_semana = horario_semana << "N/L |"
    else
      horario_semana = horario_semana << viehini.strftime("%I:%M%p") << "-" << viehfin.strftime("%I:%M%p") << " | "
    end

    horario_semana = horario_semana << "S "
    if(sabhini.nil? || sabhfin.nil? )
      horario_semana = horario_semana << "N/L |"
    else
      horario_semana = horario_semana << sabhini.strftime("%I:%M%p") << "-" << sabhfin.strftime("%I:%M%p") << " | "
    end

    horario_semana = horario_semana << "D "
    if(domhini.nil? || domhfin.nil? )
      horario_semana = horario_semana << "N/L"
    else
      horario_semana = horario_semana << domhini.strftime("%I:%M%p") << "-" << domhfin.strftime("%I:%M%p")
    end
  end
end
