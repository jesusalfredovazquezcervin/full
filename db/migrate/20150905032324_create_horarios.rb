class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.string :nombre
      t.time :lunhini
      t.time :lunhfin
      t.time :marhini
      t.time :marhfin
      t.time :miehini
      t.time :miehfin
      t.time :juehini
      t.time :juehfin
      t.time :viehini
      t.time :viehfin
      t.time :sabhini
      t.time :sabhfin
      t.time :domhini
      t.time :domhfin

      t.timestamps
    end
  end
end
