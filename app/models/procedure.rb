class Procedure < ActiveRecord::Base
  belongs_to :cliente
  has_many :steps
  has_one :form
  validates :cliente_id, :name,
      presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:name]}


end
