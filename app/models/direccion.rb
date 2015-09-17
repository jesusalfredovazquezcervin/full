class Direccion < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :photo, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  #do_not_validate_attachment_file_type :photo
  validates :sucursal_id, :cliente_id, :calle, :numero, :delegacion, :cp, :referencia,
      presence: true
  validates :sucursal_id,
      uniqueness: {scope: :cliente_id}

end
