class AddCodestringToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :code
    add_column :products, :code, :string
  end
end
