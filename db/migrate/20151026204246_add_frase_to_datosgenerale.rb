class AddFraseToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :frase, :string
  end
end
