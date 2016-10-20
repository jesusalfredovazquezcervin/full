class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.datetime :start
      t.datetime :end
      t.references :information, index: true

      t.timestamps
    end
  end
end
