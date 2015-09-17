class CreateFormapagos < ActiveRecord::Migration
  def change
    create_table :formapagos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
