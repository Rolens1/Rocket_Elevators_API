require "application_system_test_case"

class GoogleMapsTest < ApplicationSystemTestCase
  setup do
    @google_map = google_maps(:one)
  end

  test "visiting the index" do
    visit google_maps_url
    assert_selector "h1", text: "Google Maps"
  end

  test "creating a Google map" do
    visit google_maps_url
    click_on "New Google Map"

    fill_in "Client name", with: @google_map.client_name
    fill_in "Full name technical contact", with: @google_map.full_name_technical_contact
    fill_in "Latitude", with: @google_map.latitude
    fill_in "Location", with: @google_map.location
    fill_in "Longitude", with: @google_map.longitude
    fill_in "Number of batteries", with: @google_map.number_of_batteries
    fill_in "Number of columns", with: @google_map.number_of_columns
    fill_in "Number of elevators", with: @google_map.number_of_elevators
    fill_in "Number of floors", with: @google_map.number_of_floors
    click_on "Create Google map"

    assert_text "Google map was successfully created"
    click_on "Back"
  end

  test "updating a Google map" do
    visit google_maps_url
    click_on "Edit", match: :first

    fill_in "Client name", with: @google_map.client_name
    fill_in "Full name technical contact", with: @google_map.full_name_technical_contact
    fill_in "Latitude", with: @google_map.latitude
    fill_in "Location", with: @google_map.location
    fill_in "Longitude", with: @google_map.longitude
    fill_in "Number of batteries", with: @google_map.number_of_batteries
    fill_in "Number of columns", with: @google_map.number_of_columns
    fill_in "Number of elevators", with: @google_map.number_of_elevators
    fill_in "Number of floors", with: @google_map.number_of_floors
    click_on "Update Google map"

    assert_text "Google map was successfully updated"
    click_on "Back"
  end

  test "destroying a Google map" do
    visit google_maps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Google map was successfully destroyed"
  end
end
