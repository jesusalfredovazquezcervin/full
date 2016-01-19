class Form1 < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :usuario
end
