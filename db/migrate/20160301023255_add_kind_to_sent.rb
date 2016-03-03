class AddKindToSent < ActiveRecord::Migration
  def change
    add_column :sents, :kind, :string
  end
end
