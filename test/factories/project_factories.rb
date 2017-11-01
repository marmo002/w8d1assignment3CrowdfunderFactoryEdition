FactoryBot.define do
  factory :project do
    title "SpaceShip Wow"
    description "We wont stop til Mars"
    start_date  Date.today
    end_date    Date.today + 1.year
    goal        50000
    user_id 1000
  end
end
