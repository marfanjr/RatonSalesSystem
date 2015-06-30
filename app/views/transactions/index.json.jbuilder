json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :employee_id, :customer_id, :party_id, :quantity, :value
  json.url transaction_url(transaction, format: :json)
end
