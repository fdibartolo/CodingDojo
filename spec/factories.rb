FactoryGirl.define do
  factory :session do
    date        Date.today
    start_time  Time.now
    end_time    Time.now + 1.hour
    status      "Open"
  end
end