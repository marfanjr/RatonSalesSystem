class AddressGateway

  def address_for_zipcode(zipcode)
    Correios::CEP::AddressFinder.get zipcode
  end

end