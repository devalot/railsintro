class AddFormationYearToArtists < ActiveRecord::Migration
  def change
    add_column(:artists, :formation_year, :integer)
  end
end
