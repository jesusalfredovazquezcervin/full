class Step < ActiveRecord::Base
  belongs_to :procedure
  validates :procedure_id, :name, :detail, :number,
            presence: true
  validates :procedure_id,
            uniqueness:  {scope: [:name]}

end
