class GoogleMapsController < ApplicationController

def index
    gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDjhiwqbWxaWtLDpapcXUHQVkb27zyIslY')
    google_maps.each do |google_map|
        geocode = gmaps.geocode(google_map.location)
    end
end

end
