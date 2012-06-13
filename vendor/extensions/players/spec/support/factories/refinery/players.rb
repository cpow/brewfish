
FactoryGirl.define do
  factory :player, :class => Refinery::Players::Player do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

