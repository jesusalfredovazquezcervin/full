class Information < ActiveRecord::Base
  belongs_to :form
  belongs_to :usuario
  belongs_to :userupdate, class_name: "Usuario"
  has_many :sents
  belongs_to :datosgenerale
  has_one :call, :dependent => :destroy
  validates :form_id, :usuario_id,
            presence: true

  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

end
