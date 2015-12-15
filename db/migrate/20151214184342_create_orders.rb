class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :agenda_id
      t.integer :usuario_id
      t.integer :cliente_id

      t.timestamps
    end
  end
end
