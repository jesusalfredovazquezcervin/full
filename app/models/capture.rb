class Capture < ActiveRecord::Base
  belongs_to :cliente
  validates :cliente_id,
            presence: true
end
