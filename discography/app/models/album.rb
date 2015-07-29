class Album < ActiveRecord::Base
  validates_presence_of(:artist)
  validates_presence_of(:name)
  validates_uniqueness_of(:name, scope: [:artist_id, :released_at])
  belongs_to(:artist)
end
