FactoryBot.define do
  factory :project do
    name { Faker::TvShows::BigBangTheory.characters }
    status { 1 }
    description { Faker::TvShows::BigBangTheory.quote }
  end
end
