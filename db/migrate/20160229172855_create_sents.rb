class CreateSents < ActiveRecord::Migration
  def change
    create_table :sents do |t|
      t.references :usuario, index: true
      t.references :information, index: true
      t.string :recipient

      t.timestamps
    end
  end
end
