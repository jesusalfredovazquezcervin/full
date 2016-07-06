class AddRecipientToDatosgenerale < ActiveRecord::Migration
  def change
    add_column :datosgenerales, :recipient, :string
    add_column :datosgenerales, :periodicity, :integer
    add_column :datosgenerales, :start, :date
  end
end
