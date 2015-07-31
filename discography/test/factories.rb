# This is the test/factories.rb file.
FactoryGirl.define do

  sequence(:name) do |n|
    "Artist/Album #{n}"
  end

  factory(:artist) do
    name
    formation_year(1999)
  end

  factory(:album) do
    name
    copies_sold(0)
    released_at("2014-01-01")
  end
end
