FactoryGirl.define do
  factory :session do
    date        Date.today
    start_time  Time.now
    end_time    Time.now + 1.hour
    status      "Open"
  end
  
  factory :user do
    first_name              "first"
    last_name               "last"
    enterprise_id           "sensei"
    email                   "sensei@example.com"
    password                "dojo"
    password_confirmation   "dojo"
  end
end