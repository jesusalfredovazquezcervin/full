class AddAttachmentImage2ToScalings < ActiveRecord::Migration
  def self.up
    change_table :scalings do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :scalings, :image2
  end
end
