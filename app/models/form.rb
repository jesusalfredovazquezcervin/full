class Form < ActiveRecord::Base
  has_many :fields
  belongs_to :cliente
end
