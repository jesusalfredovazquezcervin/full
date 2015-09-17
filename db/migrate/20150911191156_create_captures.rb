class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.boolean :ticket
      t.boolean :fecha
      t.boolean :fecha
      t.boolean :hora
      t.boolean :para

      t.timestamps
    end
  end
end
