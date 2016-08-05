class AddAccountToInformation < ActiveRecord::Migration
  def change
    add_reference :information, :datosgenerale, index: true
  end
end
