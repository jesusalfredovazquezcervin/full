class ChangeDataTypeForAnswerDate < ActiveRecord::Migration
  def change
    change_column :asks, :answer_date, :date
  end
end
