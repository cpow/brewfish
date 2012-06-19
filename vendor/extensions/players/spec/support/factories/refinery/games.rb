
FactoryGirl.define do
  factory :game, :class => Refinery::Games::Game do
    sequence(:opponent) { |n| "refinery#{n}" }
  end
end

