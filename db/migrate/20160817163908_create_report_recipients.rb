class CreateReportRecipients < ActiveRecord::Migration
  def change
    create_table :report_recipients do |t|
      t.references :report, index: true
      t.references :contacto, index: true

      t.timestamps
    end
  end
end
