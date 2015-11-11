class AddStatusToCapture < ActiveRecord::Migration
  def change
    add_column :captures, :status, :string
  end
end
