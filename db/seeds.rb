# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# unless Client.joins(:profile).exists?('profiles.name':"Cliente 1")
#     Client.create(profile_attributes: {
#                      name: "Cliente 1",
#                      cpf: "123456",
#                      rg: "123456",
#                      telephone: "123456",
#                      cell_phone: "123456",
#                      email: "cliente1@gmail.com",
#                      credits: 20
#                    })
# end
# unless Client.joins(:profile).exists?('profiles.name':"Cliente 2")
#     Client.create(profile_attributes: {
#                      name: "Cliente 2",
#                      cpf: "0123456",
#                      rg: "0123456",
#                      telephone: "0123456",
#                      cell_phone: "0123456",
#                      email: "cliente2@gmail.com",
#                      credits: 25
#                    })
# end

unless User.exists?(email: "marfanj@gmail.com")
  User.create(email: "marfanj@gmail.com",
              password: 'admin1234',
              password_confirmation: 'admin1234',
              confirmed_at: Time.now,
              profile_attributes: {
                     name: "Marfan",
                     telephone: "(41)98661559",
                     cell_phone: "(41)98661559",
                     email: "marfanj@gmail.com",
                     credits: 25
              })
end
