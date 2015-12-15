class Product < ActiveRecord::Base
  belongs_to :cliente
  validates :code,
            presence: true,
            uniqueness: {scope: :cliente_id}
  validates :description, :price, :measure,
            presence: true
  MEASURE = %w[gr kg lb lt ml]
  CATEGORY = %w[cachorro adulto maduro veterinario]
  PRESENTATION = %w[bolsa lata bolsa_y_lata]
  BRAND= %w[purina nupec proplan bayer]
end
