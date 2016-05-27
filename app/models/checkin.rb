class Checkin < ActiveRecord::Base
  belongs_to :usuario
  KIND = %w[in out]
end
