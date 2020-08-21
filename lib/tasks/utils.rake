namespace :utils do
  desc "Popular o banco de dados"
  task seed: :environment do

    p 'Gerando os Contatos'
    10.times do |i|
        Contact.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            kind: Kind.all.sample,
            rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample) 
        )
    end
    p 'Contatos gerados [OK]'
    
    p 'Gerando os Addresses'
    Contact.all.each do |contact|
      Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact 
      )
    end
    p 'Addresses gerados [OK]'

    p 'Gerando os Phones'
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    p 'Phones gerados [OK]'
  end

end
