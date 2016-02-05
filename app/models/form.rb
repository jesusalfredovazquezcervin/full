class Form < ActiveRecord::Base
  has_many :fields
  belongs_to :cliente
  validates :cliente_id, :name,
            presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:name]}

end
