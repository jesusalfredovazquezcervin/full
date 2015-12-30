class Field < ActiveRecord::Base
  belongs_to :form, touch: true
  DATA_TYPE = %w[String Integer Date DateTime]
end
