# frozen_string_literal: true

FactoryBot.define do
  factory :device do
    sequence(:serial) { |i| "device-#{format '%03d', i + 1}" }
  end
end
