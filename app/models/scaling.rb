class Scaling < ActiveRecord::Base
  belongs_to :datosgenerale
  belongs_to :cliente
  has_attached_file :image1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image1, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]

end
