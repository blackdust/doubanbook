json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :price, :subject, :nation
  json.url product_url(product, format: :json)
end
