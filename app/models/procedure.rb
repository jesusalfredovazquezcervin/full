class Procedure < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :datosgenerale
  has_many :steps, :dependent => :destroy
  has_one :form
  validates :cliente_id, :name, :datosgenerale_id,
      presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:name, :datosgenerale_id]}


end
