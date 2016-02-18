

FactoryGirl.define do

  factory :user, aliases: [ ] do
    first_name "jim"
    last_name "smith"
    sequence(:email) { |n| "foo#{n}@bar.com"}
    password "football"
  end

  factory :duplicate_email, class: :user do
    name "Username"
    email "foo1@bar.com"
    password "foobar"
  end

  factory :profile, aliases: [ ] do
    motto    "Great minds think alike"
    about "check this out"
    birthday Time.now - 25.years
    gender "male"
    telephone = "1-234-567-9999"
  end

  factory :comment, aliases: [ ] do
    body "comment body goes here.  And here is more comment"
  end

  factory :post, aliases: [ ] do
    body "This is a really great post body"
    author
  end

  factory :like, aliases: [ ] do
   author
  end

  factory :friending, aliases: [ ] do

  end



end
