class AddContactoToUsuario < ActiveRecord::Migration
  def change
    add_reference :usuarios, :contacto, index: true
  end
end
