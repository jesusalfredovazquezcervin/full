class AddAttachmentAvatarToAgendas < ActiveRecord::Migration
  def self.up
    change_table :agendas do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :agendas, :avatar
  end
end
