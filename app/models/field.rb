class Field < ActiveRecord::Base
  belongs_to :form, touch: true
  DATA_TYPE = %w[String Integer Date DateTime]

  validates :form_id, :name,
            presence: true
  validates :form_id,
            uniqueness:  {scope: [:name]}

end
