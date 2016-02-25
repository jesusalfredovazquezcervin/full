class Form < ActiveRecord::Base
  has_many :fields, :dependent => :destroy
  belongs_to :cliente
  belongs_to :procedure
  has_many :informations, :dependent => :destroy
  validates :cliente_id, :name,
            presence: true
  validates :cliente_id,
            uniqueness:  {scope: [:name]}

end
