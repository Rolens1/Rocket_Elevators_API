class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :type_of_address
      t.string :status
      t.string :entity
      t.string :number_and_street
      t.string :suite_appartment
      t.string :city
      t.string :postal_code
      t.string :country
      t.string :notes
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
