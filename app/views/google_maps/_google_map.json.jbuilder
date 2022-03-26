json.extract! google_map, :id, :location, :number_of_floors, :client_name, :number_of_batteries, :number_of_columns, :number_of_elevators, :full_name_technical_contact, :latitude, :longitude, :created_at, :updated_at
json.url google_map_url(google_map, format: :json)
