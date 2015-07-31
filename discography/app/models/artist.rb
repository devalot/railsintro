class Artist < ActiveRecord::Base

  ##############################################################################
  validates_presence_of(:name)
  validates_uniqueness_of(:name)

  ##############################################################################
  has_many(:albums)

  ##############################################################################
  # Return +true+ if this artist is a one-hit wonder.
  #
  # One-hit wonders are artists who have a single album with
  # +copies_sold+ greater than the 150% of the average +copies_sold+
  # for all albums.
  #
  # Note:
  #
  #     albums.map(&:copies_sold)
  #
  # Is the same thing as:
  #
  #     albums.map {|a| a.copies_sold}
  #
  def one_hit_wonder?
    average = albums.map(&:copies_sold).sum.to_f / albums.size.to_f * 0.5
    albums.one? {|a| a.copies_sold.to_f > average}
  end
end
