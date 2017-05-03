class AddAttachmentImage1ToScalings < ActiveRecord::Migration
  def self.up
    change_table :scalings do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :scalings, :image1
  end
end
