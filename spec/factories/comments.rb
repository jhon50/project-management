FactoryBot.define do
  factory :comment do
    description { Faker::TvShows::BigBangTheory.quote }
  end
end
