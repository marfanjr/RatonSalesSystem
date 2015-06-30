json.array!(@parties) do |party|
  json.extract! party, :id, :name, :party_date
  json.url party_url(party, format: :json)
end
