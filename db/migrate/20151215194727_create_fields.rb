class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :form_id
      t.string :name
      t.string :type
      t.boolean :mandatory
      t.boolean :show_in_list

      t.timestamps
    end
  end
end
