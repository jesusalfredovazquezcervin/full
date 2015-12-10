class Direccion < ActiveRecord::Base
  class MatrizValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if record.matriz
        if Direccion.where(:cliente_id => record.cliente_id, :matriz => true).count > 0
          record.errors[attribute] << (options[:message] || "solo un cliente, sucursal puede tener matriz = true")
        end
      end
    end
  end

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :photo, :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg"]
  #do_not_validate_attachment_file_type :photo
  validates :sucursal_id, :cliente_id, :calle, :numero, :delegacion, :cp, :referencia,
      presence: true
  validates :sucursal_id,
      uniqueness: {scope: [:cliente_id], message: "La combinacion Cliente, Sucursal ya esta en uso"}

  validates :matriz, matriz: true

  belongs_to :cliente



end

=begin

class Person < ActiveRecord::Base
  validates :email, presence: true, email: true
end

if Cliente.find(record.cliente_id).matriz==true
  record.errors[:matriz] << 'Solo una sucursal puede ser Matriz'
end
=end

