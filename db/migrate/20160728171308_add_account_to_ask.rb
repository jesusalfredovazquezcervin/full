class AddAccountToAsk < ActiveRecord::Migration
  def change
    add_reference :asks, :datosgenerale, index: true
  end
end
