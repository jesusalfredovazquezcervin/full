class CreateDetailReports < ActiveRecord::Migration
  def change
    create_table :detail_reports do |t|
      t.references :report, index: true
      t.references :field, index: true
      t.integer :position

      t.timestamps
    end
  end
end
