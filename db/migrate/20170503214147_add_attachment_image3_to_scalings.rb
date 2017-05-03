class AddAttachmentImage3ToScalings < ActiveRecord::Migration
  def self.up
    change_table :scalings do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :scalings, :image3
  end
end
