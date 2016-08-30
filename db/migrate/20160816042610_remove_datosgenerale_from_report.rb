class RemoveDatosgeneraleFromReport < ActiveRecord::Migration
  def change
    remove_column :reports, :datosgenerale_id, :integer
  end
end
