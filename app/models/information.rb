class Information < ActiveRecord::Base
  belongs_to :form
  belongs_to :usuario
  validates :form_id, :usuario_id,
            presence: true
end
