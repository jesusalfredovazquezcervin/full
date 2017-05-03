class AddClienteToScaling < ActiveRecord::Migration
  def change
    add_reference :scalings, :cliente, index: true, foreign_key: true
  end
end
