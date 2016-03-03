class Information < ActiveRecord::Base
  belongs_to :form
  belongs_to :usuario
  has_many :sents
  validates :form_id, :usuario_id,
            presence: true
end
