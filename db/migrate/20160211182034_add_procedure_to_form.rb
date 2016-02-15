class AddProcedureToForm < ActiveRecord::Migration
  def change
    add_reference :forms, :procedure, index: true
  end
end
