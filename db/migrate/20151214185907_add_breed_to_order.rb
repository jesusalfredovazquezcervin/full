class AddBreedToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :breed, :string
    add_column :orders, :age, :integer
  end
end
