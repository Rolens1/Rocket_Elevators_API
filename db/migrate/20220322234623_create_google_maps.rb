class CreateGoogleMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :google_maps do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.string :location
      t.integer :number_of_floors
      t.string :client_name
      t.integer :number_of_batteries
      t.integer :number_of_columns
      t.integer :number_of_elevators
      t.string :full_name_technical_contact


      t.timestamps
    end
  end
end
