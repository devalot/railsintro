class AddCopiesSoldToAlbums < ActiveRecord::Migration
  def change
    add_column(:albums, :copies_sold, :integer)
  end
end
