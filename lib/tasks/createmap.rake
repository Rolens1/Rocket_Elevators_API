namespace :maps do
    task :make => :environment do
        puts "Generating new Google Map addition..."
        json = File.read("rrad/addresses-us-all.min.json")
        hash = JSON.parse(json, object_class: OpenStruct)
        randAdd = hash['addresses'].sample
        typeAddress = ["residential", "commercial", "corporate", "hybrid"]
        if randAdd.address2.length != 0
        fullAddress = randAdd.address1 + ", " + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
        address2 = randAdd.address2
        else
        fullAddress = randAdd.address1 + ", "  + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
        address2 = "N/A"
        end
        numberBatteries = Random.new.rand(1..3)
        numberColumns = Random.new.rand(1..4)
        numberElevators = Random.new.rand(1..6)
        floorsServed = Random.new.rand(10..100)
        
            user = User.create(
            last_name: Faker::Name.last_name.gsub(/\W/, ''), 
            first_name: Faker::Name.first_name.gsub(/\W/, ''), 
            email: Faker::Internet.email, 
            password: 123456, 
            created_at: Faker::Date.between(from: '2019-01-01', to: Date.today)
            )
            address = Address.create!(
                type_of_address: typeAddress.sample,
                entity: "N/A",
                number_and_street:randAdd.address1,
                city: randAdd.city,
                postal_code: randAdd.postalCode,
                country: randAdd.state,
            )
            customer = Customer.create!(
                customer_creation_date: user.created_at,
                company_name: Faker::Company.name.gsub(/\W/, ''),
                full_name_company_contact: Faker::Name.name.gsub(/\W/, ''),
                company_contact_phone: Faker::PhoneNumber.phone_number,
                email_company: Faker::Internet.email.gsub(/\W/, ''),
                company_description: Faker::Company.bs,
                full_name_service_technical_authority: (user.first_name + user.last_name),
                technical_authority_phone: Faker::PhoneNumber.phone_number,
                technical_authority_email: user.email,
                created_at: user.created_at,
                user_id: user.id,
                address_id: address.id
            )
            map = GoogleMap.create!(
                customer_id: customer.id,
                latitude: randAdd.coordinates.lat,
                longitude: randAdd.coordinates.lng,
                location: address.number_and_street + ", " + address.city + ", " + address.country + ", " + address.postal_code,
                number_of_floors: floorsServed,
                client_name: customer.full_name_company_contact,
                number_of_batteries: numberBatteries,
                number_of_columns: numberColumns,
                number_of_elevators: numberElevators,
                full_name_technical_contact: customer.full_name_service_technical_authority
            )
          puts "Map generated."
    end
end