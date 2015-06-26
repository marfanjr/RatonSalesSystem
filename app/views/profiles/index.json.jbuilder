json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :cpf, :rg, :telephone, :cell_phone, :email, :credits
  json.url profile_url(profile, format: :json)
end
