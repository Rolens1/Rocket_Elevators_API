class CreateGoogleMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :google_maps do |t|
      t.string :location
      t.integer :number_of_floors
      t.string :client_name
      t.string :number_of_batteries
      t.string :number_of_columns
      t.string :number_of_elevators
      t.string :full_name_technical_contact
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
