

FactoryGirl.define do

  factory :user, aliases: [ :author, :initiator, :recipient ] do
    first_name "jim"
    last_name "smith"
    sequence(:email) { |n| "foo#{n}@bar.com"}
    password "football"
  end

  # factory :user, aliases: [ :recipient ] do
  #   first_name "al"
  #   last_name "day"
  #   sequence(:email) { |n| "al#{n}@bar.com"}
  #   password "football"
  # end

  factory :duplicate_email, class: :user do
    first_name "Username"
    email "bar1@bar.com"
    password "foobar"
  end

  factory :profile, aliases: [ ] do
    motto    "Great minds think alike"
    about "check this out"
    birthday Time.now - 25.years
    gender "male"
    telephone = "1-234-567-9999"
    user
  end

  factory :comment, aliases: [ ] do
    body "comment body goes here.  And here is more comment"
    author
  end

  factory :post, aliases: [ ] do
    body "This is a really great post body"
    author
  end

  factory :like, aliases: [ ] do
    author
  end

  factory :friending, aliases: [ ] do
    initiator
    recipient
  end



end
