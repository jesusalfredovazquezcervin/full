class AddSenttoToReportsents < ActiveRecord::Migration
  def change
    add_column :report_sents, :sent_to, :text
  end
end
