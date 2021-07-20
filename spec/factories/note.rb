# frozen_string_literal: true

FactoryBot.define do
  factory :note do
    title { FFaker::Lorem.word }
    body { FFaker::Lorem.phrase }
  end
end
