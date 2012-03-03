FactoryGirl.define do
  factory :session do
    date      Date.today
    status    "Open"
  end
end