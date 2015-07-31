require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  setup do
    @artist = FactoryGirl.build(:artist)
  end

  test("positive one-hit wonder") do
    @artist.albums << FactoryGirl.build(:album, {
                                          artist: @artist,
                                          copies_sold: 200_000,
                                        })

    @artist.albums << FactoryGirl.build(:album, {
                                          artist: @artist,
                                          copies_sold: 1_000,
                                        })

    assert(@artist.one_hit_wonder?, "should be a one-hit wonder")
  end

  test("negative one-hit wonder") do
    @artist.albums << FactoryGirl.build(:album, {
                                          artist: @artist,
                                          copies_sold: 10_000,
                                        })

    @artist.albums << FactoryGirl.build(:album, {
                                          artist: @artist,
                                          copies_sold: 12_000,
                                        })

    assert(!@artist.one_hit_wonder?, "should *NOT* be a one-hit wonder")
  end
end
