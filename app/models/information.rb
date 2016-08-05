class Information < ActiveRecord::Base
  belongs_to :form
  belongs_to :usuario
  has_many :sents
  belongs_to :datosgenerale
  validates :form_id, :usuario_id,
            presence: true
end
