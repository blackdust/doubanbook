json.array!(@orders) do |order|
  json.extract! order, :id, :information, :total_price, :phonenumber, :address, :user_id
  json.url order_url(order, format: :json)
end
