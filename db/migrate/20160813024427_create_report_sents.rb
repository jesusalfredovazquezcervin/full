class CreateReportSents < ActiveRecord::Migration
  def change
    create_table :report_sents do |t|
      t.references :report, index: true
      t.string :sent_by
      t.timestamps
    end
  end
end
