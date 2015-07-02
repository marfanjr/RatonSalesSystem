json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :employee_id, :customer_id, :party_id, :quantity, :value, :product_name, :product_price
  json.url transaction_url(transaction, format: :json)
end
