class Procedure < ActiveRecord::Base
  belongs_to :cliente
  has_many :steps
end
