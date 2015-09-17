class AddSkypeToContacto < ActiveRecord::Migration
  def change
    add_column :contactos, :skype, :string
  end
end
