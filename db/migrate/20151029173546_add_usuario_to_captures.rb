class AddUsuarioToCaptures < ActiveRecord::Migration
  def change
    add_reference :captures, :usuario, index: true
  end
end
