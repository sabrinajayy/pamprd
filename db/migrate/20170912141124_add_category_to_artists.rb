class AddCategoryToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :category, :string
  end
end
