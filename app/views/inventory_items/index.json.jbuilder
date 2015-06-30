json.array!(@inventory_items) do |inventory_item|
  json.extract! inventory_item, :id, :product_id, :party_id, :amount_purchased, :unit_cost, :total_cost, :profit_margin, :amount_sold
  json.url inventory_item_url(inventory_item, format: :json)
end
