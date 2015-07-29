class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references(:artist, null: false, index: true)
      t.string(:name, null: false)
      t.datetime(:released_at)
      t.timestamps null: false
    end
  end
end
