class AddClienteToCaptures < ActiveRecord::Migration
  def change
    add_reference :captures, :cliente, index: true
  end
end
