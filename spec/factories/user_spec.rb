# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password { '123123' }
    role { 1 }
    department
  end
end
