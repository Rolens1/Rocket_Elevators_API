class GoogleMapsController < ApplicationController

def create_map
    gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDjhiwqbWxaWtLDpapcXUHQVkb27zyIslY')
    google_maps.each do |google_map|
        geocode = gmaps.geocode(google_map.location)
    end
end

end
