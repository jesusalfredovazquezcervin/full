class RemoveRecipientFromReport < ActiveRecord::Migration
  def change
    remove_column :reports, :recipient, :string
    remove_column :reports, :query, :string
  end
end
