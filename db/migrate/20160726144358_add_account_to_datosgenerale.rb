class AddAccountToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :account, :string
  end
end
