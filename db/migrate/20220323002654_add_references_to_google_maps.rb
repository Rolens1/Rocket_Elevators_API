class AddReferencesToGoogleMaps < ActiveRecord::Migration[5.2]
  def change
    add_reference :google_maps, :customer, foreign_key: true
  end
end
