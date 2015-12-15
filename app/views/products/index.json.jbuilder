json.array!(@products) do |product|
  json.extract! product, :id, :reference, :code, :description, :size_lb, :size_kg, :price, :price_by_kg, :usability, :category
  json.url product_url(product, format: :json)
end
