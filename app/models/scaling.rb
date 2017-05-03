class Scaling < ActiveRecord::Base
  belongs_to :datosgenerale
  belongs_to :cliente
  has_attached_file :image1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image1, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  has_attached_file :image2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image2, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  has_attached_file :image3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image3, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]

end
