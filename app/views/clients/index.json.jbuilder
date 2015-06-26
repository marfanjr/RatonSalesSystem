json.array!(@clients) do |client|
  json.extract! client, :id, :profile_id
  json.url client_url(client, format: :json)
end
