class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.references :cliente, index: true
      t.references :datosgenerale, index: true
      t.string :query
      t.string :recipient
      t.string :periodicity
      t.string :schedule
      t.references :form, index: true

      t.timestamps
    end
  end
end
