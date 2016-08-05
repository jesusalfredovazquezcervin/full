class Procedure < ActiveRecord::Base
  belongs_to :cliente
  has_many :procedure_accounts, :dependent => :destroy
  has_many :datosgenerales, :through => :procedure_accounts
  has_many :steps, :dependent => :destroy
  has_one :form
  validates :cliente_id, :name,
      presence: true



end
