class AddAttachmentAvatarToContactos < ActiveRecord::Migration
  def self.up
    change_table :contactos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :contactos, :avatar
  end
end
