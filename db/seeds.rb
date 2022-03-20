User.create(email: 'mathieu.houde@codeboxx.biz', password: 123456)
User.create(email: 'patrick.thibault@codeboxx.biz', password: 123456)
User.create(email: 'francis.patry-jessop@codeboxx.biz', password: 123456)
User.create(email: 'abdul.akeeb@codebozz.biz', password: 123456)
User.create(email: 'david.amyot@codeboxx.biz', password: 123456)
User.create(email: 'thomas.carrier@codeboxx.biz', password: 123456)
User.create(email: 'timothy.wever@codeboxx.biz', password: 123456)
User.create(email: 'kiril.kleinerman@codeboxx.biz', password: 123456)
User.create(email: 'emmanuela.derilus@codeboxx.biz', password: 123456)
User.create(email: 'marie-eve.goupil@codeboxx.biz', password: 123456)
User.create(email: 'perry.sawatsky@codeboxx.biz', password: 123456)
Employee.create(user_id: 1, last_name: 'Houde', first_name: 'Mattieu', email: 'mathieu.houde@codeboxx.biz', title: 'Captain')
Employee.create(user_id: 2, last_name: 'Thibault', first_name: 'Patrick', email: 'patrick.thibault@codeboxx.biz', title: 'Engineer')
Employee.create(user_id: 3, last_name: 'Patry-Jessop', first_name: 'Francis', email: 'francis.patry-jessop@codeboxx.biz', title: 'Engineer')
Employee.create(user_id: 4, last_name: 'Akeeb', first_name: 'Abdul', email: 'abdul.akeeb@codebozz.biz', title: 'Engineer')
Employee.create(user_id: 5, last_name: 'Amyot', first_name: 'David', email: 'david.amyot@codeboxx.biz', title: 'Engineer')
Employee.create(user_id: 6, last_name: 'Carrier', first_name: 'Thomas', email: 'thomas.carrier@codeboxx.biz', title: 'Developer')
Employee.create(user_id: 7, last_name: 'Wever', first_name: 'Timothy', email: 'timothy.wever@codeboxx.biz', title: 'Developer')
Employee.create(user_id: 8, last_name: 'Kleinerman', first_name: 'Kiril', email: 'kiril.kleinerman@codeboxx.biz', title: 'Developer')
Employee.create(user_id: 9, last_name: 'Derilus', first_name: 'Emmanuela', email: 'emmanuela.derilus@codeboxx.biz', title: 'Developer')
Employee.create(user_id: 10, last_name: 'Goupil', first_name: 'Marie-Ève', email: 'marie-eve.goupil@codeboxx.biz', title: 'Developer')
Employee.create(user_id: 11, last_name: 'Sawatsky', first_name: 'Perry', email: 'perry.sawatsky@codeboxx.biz', title: 'Developer')
  
  # buildingArray = ["residential", "commercial", "corporate", "hybrid"].sample,
  # if buildingArray == "residential"
  #   numofapt = Random.new.rand(5..40),
  #   numoffloors = Random.new.rand(5..100),
  #   numofbase = Random.new.rand(5..100)
  # elsif buildingArray == "commercial"
  #   numofcomp = Random.new.rand(5..100),
  #   numoffloors = Random.new.rand(5..100),
  #   numofbase = Random.new.rand(5..100),
  #   numofpark = Random.new.rand(5..100),
  #   numofelev = Random.new.rand(5..100)
  # elsif buildingArray == "corporate"
  #   corp = Random.new.rand(5..100),
  #   numoffloors = Random.new.rand(5..100),
  #   numofbase = Random.new.rand(5..100),
  #   numofpark = Random.new.rand(5..100),
  #   maxocc = Random.new.rand(5..100)
  # else
  #   numofcomp = Random.new.rand(5..100),
  #   numoffloors = Random.new.rand(5..100),
  #   numofbase = Random.new.rand(5..100),
  #   numofpark = Random.new.rand(5..100),
  #   maxocc = Random.new.rand(5..100),
  #   bushrs = Random.new.rand(5..100)
  # end,
  # buildingtype: buildingArray,
  # elevatorNum: Random.new.rand(5..100),
  # unitPrice: Random.new.rand(10000..1000000),
  # totalPriceElevators: Random.new.rand(20000..1000000),
  # installFees: Random.new.rand(10000..1000000),
  # totalPrice: Random.new.rand(50000..1000000)
  ##############################FINISH QUOTE

    10.times do
    json = File.read("rrad/addresses-us-all.min.json")
    hash = JSON.parse(json, object_class: OpenStruct)
    randAdd = hash['addresses'].sample
    typeAddress = ["residential", "commercial", "corporate", "hybrid"]
    if randAdd.address2.length != 0
      fullAddress = randAdd.address1 + ", " + randAdd.address2 + ", "  + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
      address2 = randAdd.address2
    else
      fullAddress = randAdd.address1 + ", "  + randAdd.city + ", "  + randAdd.state + ", "  + randAdd.postalCode
      address2 = "N/A"
    end

    user = User.create(
    last_name: Faker::Name.last_name, 
    first_name: Faker::Name.first_name, 
    email: Faker::Internet.email, 
    password: 123456, 
    created_at: Faker::Date.between(from: '2019-01-01', to: Date.today)
    )
    address = Address.create!(
      type_of_address: typeAddress.sample,
      entity: "N/A",
      number_and_street:randAdd.address1,
      suite_appartment: address2,
      city: randAdd.city,
      postal_code: randAdd.postalCode,
      country: randAdd.state,
    )
    customer = Customer.create!(
      customer_creation_date: user.created_at,
      company_name: Faker::Company.name,
      full_name_company_contact: Faker::Name.name,
      company_contact_phone: Faker::PhoneNumber.phone_number,
      email_company: Faker::Internet.email,
      company_description: Faker::Company.bs,
      full_name_service_technical_authority: (user.first_name + user.last_name),
      technical_authority_phone: Faker::PhoneNumber.phone_number,
      technical_authority_email: user.email,
      created_at: user.created_at,
      user_id: user.id,
      address_id: address.id
    )
    quote = Quote.create!(
       buildingtype: ["residential", "commercial", "corporate", "hybrid"].sample,
       numofapt: Random.new.rand(5..40),
       numoffloors: Random.new.rand(5..100),
       numofbase: Random.new.rand(5..10),
       numofpark: Random.new.rand(5..100),
       numofcomp: Random.new.rand(5..100),
       numofelev: Random.new.rand(10..100),
       maxocc: Random.new.rand(100..500),
       bushrs: Random.new.rand(5..100),
       corp: Random.new.rand(5..100),
       liftCage: Random.new.rand(5..100),
       elevatorNum: Random.new.rand(5..100),
       unitPrice: "$75474573",
       totalPriceElevators: "$43242342",
       installFees: "$165456624",
       totalPrice: "$43242346",
       companyname: customer.company_name,
       email: customer.email_company
      )
      building = Building.create!(
          building_address: randAdd.address1,
          full_name_building_admin: Faker::Name.name,
          email_building_admin: Faker::Internet.email,
          phone_building_admin: Faker::PhoneNumber.phone_number,
          full_name_technical_contact: customer.full_name_service_technical_authority,
          email_technical_contact: customer.technical_authority_email,
          phone_technical_contact: customer.technical_authority_phone,
          address_id: address.id,
          customer_id: customer.id
          # buildingDetails = BuildingDetail.create(
          #   building_id: building.id
          #   number_of_floors: Faker::Number.digit
          #   type:
          #   architecture:
          #   maximum_number_of_occupants: Faker::Number.digit
          #   year_of_construction: Faker::Date.between(from: '2018-09-23', to: '2022-03-17')
          #   BuildingId: building.id
          )
                battery = Battery.create!(
                  building_id: building.id,
                  employee_id: Random.new.rand(1..12),
                  types: address.type_of_address,
                  status: ["active", "inactive"].sample,
                  date_of_commissioning: Faker::Date.between(from: '2018-09-23', to: '2022-03-17'),
                  date_of_last_inspection: Faker::Date.between(from: '2019-09-23', to: '2022-03-17'),
                  certificate_of_operations: Faker::Date.between(from: '2018-09-23', to: '2022-03-17'),
                  information: "Let me tell you 'bout my battery.",
                  notes: Faker::Company.bs
                )
                1..4.times do
                  column = Column.create!(
                    types: battery.types,
                    number_of_floors_served: Random.new.rand(10..100),
                    status: battery.status,
                    information: "Let me tell you 'bout my column.",
                    notes: battery.notes,
                    battery_id: battery.id
                  )
                  1..6.times do
                    elevator = Elevator.create!(
                      column_id: column.id,
                      serial_number: Faker::Number.hexadecimal(digits: 6),
                      model: ["standard", "premium", "excelium"].sample,
                      types: column.types,
                      status: ["idle", "moving", "maintenance" "stopped"].sample,
                      date_of_commissioning: battery.date_of_commissioning,
                      date_of_last_inspection: battery.date_of_last_inspection,
                      certificate_of_inspection: battery.certificate_of_operations,
                      information: "Let me tell you 'bout my elevator.",
                      notes: column.notes
                    )
                  end
                end
              end

  1..20.times do |lead|
    lead = Leads.create(
      fullname: Faker::Name.name,
      companyname: Faker::Company.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number,
      projectname: Faker::Company.industry,
      projectdescription: Faker::Company.bs,
      departmentincharge: Faker::IndustrySegments.sector,
      message: Faker::Company.catch_phrase 
    )
  end

# Employee creation data

  # 11.times do
  #   json = File.read("rrad/employee-data.json")
  #   hash = JSON.parse(json, object_class: OpenStruct)
  #   userData = hash['data']
  #   user = User.create!(
  #     last_name: userData.last_name,
  #     first_name: userData.first_name,
  #     email: userData.email,
  #     password: 123456
  #   )
  #   # Employee.create!(
  #   #   last_name: user.last_name,
  #   #   first_name: user.first_name,
  #   #   email: user.email,
  #   #   title: userData.title,
  #   # )
  # end