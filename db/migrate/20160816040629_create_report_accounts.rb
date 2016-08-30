class CreateReportAccounts < ActiveRecord::Migration
  def change
    create_table :report_accounts do |t|
      t.references :report, index: true
      t.references :datosgenerale, index: true

      t.timestamps
    end
  end
end
