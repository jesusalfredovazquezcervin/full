class OrderDetail < ActiveRecord::Base
  belongs_to :order
  BREED= %w[akbash akita antiguo_pastor_ingles basset_hound beagle caniche chihuahua chowchow]
end
