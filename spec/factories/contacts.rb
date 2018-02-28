FactoryBot.define do
  factory :contact do
    sequence :name do |n|
      "John Doe #{n}"
    end
    phone { rand(10**9..10**10) }

    sequence :email do |n|
      "john-doe#{n}@test.magmalabs.io"
    end

    sequence :address do |n|
      "Fake Address #{n}"
    end
  end
end
