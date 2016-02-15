class Information < ActiveRecord::Base
  belongs_to :form
  belongs_to :usuario
end
