FactoryGirl.define do
  factory :contact do
    name       "Contact"
    last_name  "User"
    bio        "Bio"
    address

    factory :contact_with_phones do
      transient do
        phones_count 3
      end

      after(:create) do |contact, evaluator|
        create_list(:phone, evaluator.phones_count, contact: contact)
      end
    end
  end
end
