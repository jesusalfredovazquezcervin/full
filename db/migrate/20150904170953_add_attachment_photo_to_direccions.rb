class AddAttachmentPhotoToDireccions < ActiveRecord::Migration
  def self.up
    change_table :direccions do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :direccions, :photo
  end
end
