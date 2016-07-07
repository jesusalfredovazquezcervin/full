class AddRecipientToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :recipient, :string
    add_column :datosgenerales, :periodicity, :string
    add_column :datosgenerales, :start, :date
  end
end
