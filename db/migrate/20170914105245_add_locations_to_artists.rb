class AddLocationsToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :address, :string
    add_column :artists, :latitude, :float
    add_column :artists, :longitude, :float
  end
end
