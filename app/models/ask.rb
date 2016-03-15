class Ask < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :usuario

  validates :cliente_id, :question,
            presence: true

end
