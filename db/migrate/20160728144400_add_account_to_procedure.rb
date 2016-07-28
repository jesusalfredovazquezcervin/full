class AddAccountToProcedure < ActiveRecord::Migration
  def change
    add_reference :procedures, :datosgenerale, index: true
  end
end
