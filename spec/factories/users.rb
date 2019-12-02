FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    user_name {Faker::Internet.username(specifier: "#{first_name} #{last_name}", separators: %w(. _ -))}
    email {Faker::Internet.unique.email}    
    password {Faker::Internet.password}    
  end
end
