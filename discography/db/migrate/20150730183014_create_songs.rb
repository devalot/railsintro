class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references(:album, null: false, index: true)
      t.string(:name, null: false)
      t.integer(:duration, null: false)
      t.timestamps null: false
    end
  end
end
