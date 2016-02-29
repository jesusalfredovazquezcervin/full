class Sent < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :information
end
