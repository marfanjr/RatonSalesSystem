json.array!(@sales) do |sale|
  json.extract! sale, :id, :client_id, :user_id, :product_id
  json.url sale_url(sale, format: :json)
end
