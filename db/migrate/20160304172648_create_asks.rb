class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.references :cliente, index: true
      t.references :usuario, index: true
      t.string :question
      t.string :asked_by
      t.string :answer
      t.string :answer_by
      t.datetime :answer_date
      t.integer :voting
      t.string :subject

      t.timestamps
    end
  end
end
